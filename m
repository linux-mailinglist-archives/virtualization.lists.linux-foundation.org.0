Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C01AA9CA
	for <lists.virtualization@lfdr.de>; Thu,  5 Sep 2019 19:14:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 684521687;
	Thu,  5 Sep 2019 17:14:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 268A61644
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 17:14:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B26667DB
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 17:14:32 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id f12so6413720iog.12
	for <virtualization@lists.linux-foundation.org>;
	Thu, 05 Sep 2019 10:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TTCctpkX00mowbNYgM0kIWU2mkTavgxoTs3XunObL/I=;
	b=pMRdQRIl9vuOA+nHETjwUCF9udSp5PW7cTCK4Jh+bPhGYJNF0N3bjjDk7LCt4Uwplm
	iy2tuWxdiYyRLTvt6r4GgT+p9RJMOnyKA+umCVnfV2wiSfDkQlKt/OSAc4Va1sy2/Qqz
	TbDiflxrsy/pVLoa5JUtgrCaOQ5PYAiwrTnu7+WQrZbvVtJuyHmeyJFPjf7E0jyPahOM
	ohpQ5Xqm2Ir1EF+98Iq5lnJBcOE146CeJz4xe6yylI16QWb/Aopse67u3uh3HEqrZuQJ
	IlwiJZNxoKbrn7dGm7qE6sYZrY6deHg0OaeBBJcjs2/p9Q3v8nplXkocXnLvQkGnGeq7
	BOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TTCctpkX00mowbNYgM0kIWU2mkTavgxoTs3XunObL/I=;
	b=Utf1OVpSgeHl6GScClkJ0TfgFuWEYxw/ZnNi5w2Zx7k+OdYyi9uVOV9vEK+91xSOv8
	wfiUDiO7tg4IvEZOgefINxYhyCyvj/vh/xIFLdnoaaWmrHxj5pAUipTtzq20gPOERQr0
	op+fFfIk0W18wiP64SRjOyehpuK6UFW0zo63XOh5Vw3rvJJPyP/kWnFBbknxxQhWufnj
	Qx5YQwivdtrVWTy4WYo9mnOui1mM1b/O4x3hpCXSlDqfmI0ydwv/Y7MuT05eTxgFdwL5
	ypoWY6sRbBddeRHgACdvGersrRG3qm2OSh/Cve42+6clIHxz13mbNxL6smmFaYEmALHj
	/sww==
X-Gm-Message-State: APjAAAW5rxY/Sp0zY4RAvG8F7VJSVweHL5WHBb4OFvT6fsRDIPVhUySt
	jWG94JBUFqxa2ccBdCXAS76Do5/5+9LuwWtXfp8=
X-Google-Smtp-Source: APXvYqyFRrcEUYAzNKAMqPVORab2OGeAkhhkQx1fB9YTAhkq6c0qW9HmWRMVc4oWCScMVD4hVjvX8XxINlOEm6TsfVc=
X-Received: by 2002:a6b:e903:: with SMTP id u3mr5289382iof.241.1567703671793; 
	Thu, 05 Sep 2019 10:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190904074828.32502-1-kraxel@redhat.com>
	<CAPaKu7RWiEr5n_DWcg0H2PPnRs9CUn-ZgQV3NYe8VrdZgEAhTQ@mail.gmail.com>
	<20190905052340.gfwmzkqwcpxtvzvu@sirius.home.kraxel.org>
In-Reply-To: <20190905052340.gfwmzkqwcpxtvzvu@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 5 Sep 2019 10:14:20 -0700
Message-ID: <CAPaKu7RCwP05buzpL-MVYYUOzmWaQqNWjom7RK-2fL8hB2w45Q@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix command submission with objects but
	without fence.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
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

On Wed, Sep 4, 2019 at 10:23 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Sep 04, 2019 at 04:10:30PM -0700, Chia-I Wu wrote:
> > On Wed, Sep 4, 2019 at 12:48 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > Only call virtio_gpu_array_add_fence if we actually have a fence.
> > >
> > > Fixes: da758d51968a ("drm/virtio: rework virtio_gpu_execbuffer_ioctl fencing")
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > ---
> > >  drivers/gpu/drm/virtio/virtgpu_vq.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> > > index 595fa6ec2d58..7fd2851f7b97 100644
> > > --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> > > +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> > > @@ -339,11 +339,12 @@ static void virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
> > >                 goto again;
> > >         }
> > >
> > > -       if (fence)
> > > +       if (fence) {
> > >                 virtio_gpu_fence_emit(vgdev, hdr, fence);
> > > -       if (vbuf->objs) {
> > > -               virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
> > > -               virtio_gpu_array_unlock_resv(vbuf->objs);
> > > +               if (vbuf->objs) {
> > > +                       virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
> > > +                       virtio_gpu_array_unlock_resv(vbuf->objs);
> > > +               }
> > This leaks when fence == NULL and vbuf->objs != NULL (which can really
> > happen IIRC... not at my desk to check).
>
> Yes, it can happen, for example when flushing dumb buffers.
>
> But I don't think we leak in this case.  The code paths which don't need
> a fence also do not call virtio_gpu_array_lock_resv(), so things are
> balanced.  The actual release of the objs happens in
> virtio_gpu_dequeue_ctrl_func() via virtio_gpu_array_put_free_delayed().
I misread and thought this was in virtio_gpu_dequeue_ctrl_func.  Sorry :(

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>



>
> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
