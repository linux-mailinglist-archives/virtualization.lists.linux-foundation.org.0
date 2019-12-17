Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBE012356C
	for <lists.virtualization@lfdr.de>; Tue, 17 Dec 2019 20:10:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8E55487D94;
	Tue, 17 Dec 2019 19:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2+EveTlqOJC; Tue, 17 Dec 2019 19:09:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A36EA87D80;
	Tue, 17 Dec 2019 19:09:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B75BC077D;
	Tue, 17 Dec 2019 19:09:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1F83C077D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ECC2E86165
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Snlftqkyb7xu
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:09:55 +0000 (UTC)
X-Greylist: delayed 00:05:09 by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7610E85721
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 19:09:55 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id r14so7768089lfm.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 11:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pVYjEcBdxojzKIemMEXzbN7ObN1dUIfwUdWRydEgJKk=;
 b=jVhoVLMSW2nAbomL50Lr5ZScn7BgHedBrUiRqggr1EyhXT6SokfxM8KH2OG0WxCKUq
 SxidSNs0aXrgCi89vSK1+NxToA7w+MNY+C2go0vW0UPAltmjntKzEH1R8gYDuKjH4Q+l
 Kap3EzX86ZnOOnm7OyUazwDaEGU/Eekb0+jRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pVYjEcBdxojzKIemMEXzbN7ObN1dUIfwUdWRydEgJKk=;
 b=pXpw4hjx7WgmkkGQAX3M1IOZigfxc8FlTwbcOKdD7cajYrwHHgvcjrCtYEC/S0jfir
 rSVDX+Dv0Ydmk1mp2zSJJUqxUPePRKzWcSQQFW9tzJdXfIj8RfX4qrEJIe49LQJKAMLg
 biIVjJw007qjlIF6VpuX39dT7Mo6PeKoSjvzQGlYQNhoQ+qX/ChpZ0ZE+K6I2iAcyfq6
 rs1GG7gQi1+SlYRX4diJ2Chbyh2yHFvkD9CM4in8fmXu4CiknN7ByQwPwGahWv/zg8iD
 ObN6pwmSHN2WGLA1b/+IgfsQos0JRWNiXcX2Ko9WJ6q0CYz3rQFQeAXR9JD6fjvFlGUT
 +8fA==
X-Gm-Message-State: APjAAAVqOFafU+zFSeJmBcqlgifLIuMDD5K8ht9/uU73TJytY2H7pc9E
 bnXqhoutf7mVsyI8mWNvkWffqxVJi9E=
X-Google-Smtp-Source: APXvYqwWD/ifadzGi+xEMKlpMYXoWMvZSBl5SSIeGrjftViHy8wYMqWsWqWP/U1XL9EzZVMcczAMvw==
X-Received: by 2002:ac2:4c98:: with SMTP id d24mr3657545lfl.138.1576609483668; 
 Tue, 17 Dec 2019 11:04:43 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id h18sm13024528ljk.94.2019.12.17.11.04.41
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 11:04:42 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id r14so7756762lfm.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 11:04:41 -0800 (PST)
X-Received: by 2002:ac2:4909:: with SMTP id n9mr3781847lfi.21.1576609481433;
 Tue, 17 Dec 2019 11:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20191216231429.38202-1-dverkamp@chromium.org>
 <20191217101108.7bf5018d.cohuck@redhat.com>
In-Reply-To: <20191217101108.7bf5018d.cohuck@redhat.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Tue, 17 Dec 2019 11:04:14 -0800
X-Gmail-Original-Message-ID: <CABVzXAkvGptpY0T_uUEWa1=LjVfXYNAebbdq=P-AMuEioD+x=g@mail.gmail.com>
Message-ID: <CABVzXAkvGptpY0T_uUEWa1=LjVfXYNAebbdq=P-AMuEioD+x=g@mail.gmail.com>
Subject: Re: [PATCH] virtio-balloon: request nvqs based on features
To: Cornelia Huck <cohuck@redhat.com>
Cc: Liang Li <liang.z.li@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Dec 17, 2019 at 1:11 AM Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Mon, 16 Dec 2019 15:14:29 -0800
> Daniel Verkamp <dverkamp@chromium.org> wrote:
>
> > After 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT"),
> > the virtio-balloon device unconditionally specifies 4 virtqueues as the
> > argument to find_vqs(), which means that 5 MSI-X vectors are required in
> > order to assign one vector per VQ plus one for configuration changes.
> >
> > However, in cases where the virtio device only provides exactly as many
> > MSI-X vectors as required for the features it implements (e.g. 3 for the
> > basic configuration of inflate + deflate + config), this results in the
> > selection of the fallback configuration where one interrupt vector is
> > used for all VQs instead of having one VQ per vector.
> >
> > Restore the logic that chose nvqs conditionally based on enabled
> > features, which was removed as part of the aforementioned commit.
> > This is slightly more complex than just incrementing a counter of the
> > number of VQs, since the queue for a given feature is assigned a fixed
> > index.
>
> As Wei already said, this should not be necessary, but see below.
>
> >
> > Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
> > ---
> >  drivers/virtio/virtio_balloon.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> > index 93f995f6cf36..67c6318d77c7 100644
> > --- a/drivers/virtio/virtio_balloon.c
> > +++ b/drivers/virtio/virtio_balloon.c
> > @@ -465,6 +465,7 @@ static int init_vqs(struct virtio_balloon *vb)
> >       vq_callback_t *callbacks[VIRTIO_BALLOON_VQ_MAX];
> >       const char *names[VIRTIO_BALLOON_VQ_MAX];
> >       int err;
> > +     unsigned nvqs;
> >
> >       /*
> >        * Inflateq and deflateq are used unconditionally. The names[]
> > @@ -475,20 +476,24 @@ static int init_vqs(struct virtio_balloon *vb)
> >       names[VIRTIO_BALLOON_VQ_INFLATE] = "inflate";
> >       callbacks[VIRTIO_BALLOON_VQ_DEFLATE] = balloon_ack;
> >       names[VIRTIO_BALLOON_VQ_DEFLATE] = "deflate";
> > +     nvqs = VIRTIO_BALLOON_VQ_DEFLATE + 1;
> > +
> >       names[VIRTIO_BALLOON_VQ_STATS] = NULL;
> >       names[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
>
> Note that we set names[q] to NULL, but not callbacks[q].

Indeed, good catch - this looks like the root cause of the problem,
since callbacks for unavailable features are left uninitialized.

> >
> >       if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {
> >               names[VIRTIO_BALLOON_VQ_STATS] = "stats";
> >               callbacks[VIRTIO_BALLOON_VQ_STATS] = stats_request;
> > +             nvqs = VIRTIO_BALLOON_VQ_STATS + 1;
> >       }
> >
> >       if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
> >               names[VIRTIO_BALLOON_VQ_FREE_PAGE] = "free_page_vq";
> >               callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
> > +             nvqs = VIRTIO_BALLOON_VQ_FREE_PAGE + 1;
> >       }
> >
> > -     err = vb->vdev->config->find_vqs(vb->vdev, VIRTIO_BALLOON_VQ_MAX,
> > +     err = vb->vdev->config->find_vqs(vb->vdev, nvqs,
> >                                        vqs, callbacks, names, NULL, NULL);
>
> This will end up in vp_find_vqs_msix() eventually, which will try to
> determine the number of needed vectors based upon whether callbacks[q]
> is !NULL. That's probably the reason you end up trying to use more
> vectors than needed. (Further down in that function, the code will skip
> any queue with names[q] == NULL, but that's too late for determining
> the number of vectors.)
>
> So I think that either (a) virtio-pci should avoid trying to allocate a
> vector for queues with names[q] == NULL, or (b) virtio-balloon should
> clean out callbacks[q] for unused queues as well. Maybe both?

I've tested a patch for (b), which resolves the problem I was seeing
as well; this looks like a clear undefined behavior fix, so I'll send
at least that one.

I will also put together a patch for (a), although now that I
understand the find_vqs logic better, I think this mostly shouldn't be
necessary assuming virtio drivers correctly initialize the parameters
they pass to it.

Thanks,
-- Daniel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
