Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C36DADDD8
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 19:12:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5A65DE94;
	Mon,  9 Sep 2019 17:12:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 27429E51
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 17:12:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9BDF8EC
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 17:12:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k6so2632222wrn.11
	for <virtualization@lists.linux-foundation.org>;
	Mon, 09 Sep 2019 10:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jqdidbzPeA/sgt3s+DYxvSvIwPPs0smJm/TWV8LV8WA=;
	b=H3OftagEfFDm375McT0XbKcLTDfqJHbzZnQHwb0rA1h8doy/xHjSC9X0c5D+htCHWG
	d3hFKxdBvz0XJR1VYgPZ71ZxU6vs2svcVObFBW9pjRVLQne3RWi9X2Wf+RbRqwNl2cai
	G0mBpLKVsMczLpBRdH2Ud7cOoSVlZnkaCnsN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jqdidbzPeA/sgt3s+DYxvSvIwPPs0smJm/TWV8LV8WA=;
	b=RG5vb6IANC/u9xmvJn2AToy11Wb0fI1mGGSbFYDtMLJooI7m1r5iq6PzZKN4c6Kg0u
	DvDEsaVxDHUfdih59EPSRTDhDmKJ/0ykQYW90U4NJDuaCmPokPvt4y4oWbTdQMsKKmHp
	CvEI8uihVPckp6s75kX707iMsGvwt3BDnfP6ZXzulzkLsTP0cKGLJxo3IPHtvJWFqrSl
	g89vu3JcnmCT8fGuV2J1KZg7Y6LukZdsn8WxXZqMv6IIl77M8h5ExuCVPrBte+WMXflL
	KupNmBUBoh5xtNZ+3U9GzjH5FBkc0Q7wl4Jd0J0iF1Xz7fTFoSaBHvCDcSVkC6k5OTCc
	5j4Q==
X-Gm-Message-State: APjAAAVpEXkis5tg1VryDaSWxemgXSZlVOBky/fbNYPNjFy5yil+/75B
	oH4xOSq1izhDLeshaQjaNZCZve5Eh0vJiAJme48FEw==
X-Google-Smtp-Source: APXvYqxRYqXaWD9NPcEGlHG2PQGB7kVycmg6gplz6JAGUJ9RYnlUeXsXl8u0K9fNh8PZ078dfQoUs/gEHoU+sQ2Dst8=
X-Received: by 2002:adf:fa10:: with SMTP id m16mr14700174wrr.322.1568049140887;
	Mon, 09 Sep 2019 10:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190829212417.257397-1-davidriley@chromium.org>
	<20190905220008.75488-1-davidriley@chromium.org>
	<20190906051847.75mj4772nqwdper6@sirius.home.kraxel.org>
In-Reply-To: <20190906051847.75mj4772nqwdper6@sirius.home.kraxel.org>
From: David Riley <davidriley@chromium.org>
Date: Mon, 9 Sep 2019 10:12:09 -0700
Message-ID: <CAASgrz2tPPEiArFb=HaTJwoshrdS9xaOaLYtG1Ah43Rfcb=iSA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Use vmalloc for command buffer allocations.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu, Sep 5, 2019 at 10:18 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > +/* How many bytes left in this page. */
> > +static unsigned int rest_of_page(void *data)
> > +{
> > +     return PAGE_SIZE - offset_in_page(data);
> > +}
>
> Not needed.
>
> > +/* Create sg_table from a vmalloc'd buffer. */
> > +static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
> > +{
> > +     int nents, ret, s, i;
> > +     struct sg_table *sgt;
> > +     struct scatterlist *sg;
> > +     struct page *pg;
> > +
> > +     *sg_ents = 0;
> > +
> > +     sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
> > +     if (!sgt)
> > +             return NULL;
> > +
> > +     nents = DIV_ROUND_UP(size, PAGE_SIZE) + 1;
>
> Why +1?

This is part of handling offsets within the vmalloc buffer and to
maintain parity with the !is_vmalloc_addr/existing case (sg_init_one
handles offsets within pages internally).  I had left it in because
this is being used for all sg/descriptor generation and I wasn't sure
if someone in the future might do something like:
buf = vmemdup_user()
offset = find_interesting(buf)
queue(buf + offset)

To respond specifically to your question, if we handle offsets, a
vmalloc_to_sgt(size = PAGE_SIZE + 2) could end up with 3 sg_ents with
the +1 being to account for that extra page.

I'll just remove all support for offsets in v3 of the patch and
comment that functionality will be different based on where the buffer
was originally allocated from.

>
> > +     ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
> > +     if (ret) {
> > +             kfree(sgt);
> > +             return NULL;
> > +     }
> > +
> > +     for_each_sg(sgt->sgl, sg, nents, i) {
> > +             pg = vmalloc_to_page(data);
> > +             if (!pg) {
> > +                     sg_free_table(sgt);
> > +                     kfree(sgt);
> > +                     return NULL;
> > +             }
> > +
> > +             s = rest_of_page(data);
> > +             if (s > size)
> > +                     s = size;
>
> vmalloc memory is page aligned, so:

As per above, will remove with v3.

>
>                 s = min(PAGE_SIZE, size);
>
> > +             sg_set_page(sg, pg, s, offset_in_page(data));
>
> Offset is always zero.

As per above, will remove with v3.
>
> > +
> > +             size -= s;
> > +             data += s;
> > +             *sg_ents += 1;
>
> sg_ents isn't used anywhere.

It's used for outcnt.

>
> > +
> > +             if (size) {
> > +                     sg_unmark_end(sg);
> > +             } else {
> > +                     sg_mark_end(sg);
> > +                     break;
> > +             }
>
> That looks a bit strange.  I guess you need only one of the two because
> the other is the default?

I was being overly paranoid and not wanting to make assumptions about
the initial state of the table.  I'll simplify.
>
> >  static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
> >                                              struct virtio_gpu_vbuffer *vbuf,
> >                                              struct virtio_gpu_ctrl_hdr *hdr,
> >                                              struct virtio_gpu_fence *fence)
> >  {
> >       struct virtqueue *vq = vgdev->ctrlq.vq;
> > +     struct scatterlist *vout = NULL, sg;
> > +     struct sg_table *sgt = NULL;
> >       int rc;
> > +     int outcnt = 0;
> > +
> > +     if (vbuf->data_size) {
> > +             if (is_vmalloc_addr(vbuf->data_buf)) {
> > +                     sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size,
> > +                                          &outcnt);
> > +                     if (!sgt)
> > +                             return -ENOMEM;
> > +                     vout = sgt->sgl;
> > +             } else {
> > +                     sg_init_one(&sg, vbuf->data_buf, vbuf->data_size);
> > +                     vout = &sg;
> > +                     outcnt = 1;
>
> outcnt must be set in both cases.

outcnt is set by vmalloc_to_sgt.

>
> > +static int virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
> > +                                     struct virtio_gpu_vbuffer *vbuf)
> > +{
> > +     return virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, NULL, NULL);
> > +}
>
> Changing virtio_gpu_queue_ctrl_buffer to call
> virtio_gpu_queue_fenced_ctrl_buffer should be done in a separate patch.

Will do.

Thanks,
David
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
