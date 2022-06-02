


public float sqr(float x)
{
  return (x*x);
}



public float Dist(float x1, float y1, float x2, float y2)
{
  return (float)Math.sqrt(sqr(x2 - x1) + sqr(y2 - y1));
}



public float distPointX(float angle, float dist)
{
  return (float) (dist*(Math.sin(90-angle)));
}
