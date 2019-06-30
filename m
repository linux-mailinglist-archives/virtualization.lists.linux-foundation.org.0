Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3E85B157
	for <lists.virtualization@lfdr.de>; Sun, 30 Jun 2019 20:42:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ADA1ED38;
	Sun, 30 Jun 2019 18:42:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1FD9DCDF
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 18:42:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B5138A8
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 18:42:36 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u13so23722922iop.0
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 11:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QDSijjS1xXueLHNMMqTIhyO9jX2UJsvp3nUT87AqiGI=;
	b=Emhed+tl7EdEvirZ/81+czghnaAYl79gEfihBwTiJ97+LKwiG68+VS+CHihBWaEOQV
	zwwiuyIkcDRa3FgNnZKTDxe8BL2qflZc2MbNjhc6vQTUvLQlbAg7l6G+d98WxHi67oku
	CgSpPUfNxpAkz7iYWZ+R9dwslRE4Ly0uUTpWF4RoXt9nwklOA9OKSMbeE6n4RTaIh+5D
	vNx6PJInFmhrIiLqZnehfguHPOB02XFHM8OtdfdSFOYXYtqz96BY7NRq7yr+92b+ZQoO
	aQunq3wV+kRdpmRaQjqlZaUViaHUttS94Al/radLkStdbTl22SlZnqcxXeBc7WbEMkEG
	J9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QDSijjS1xXueLHNMMqTIhyO9jX2UJsvp3nUT87AqiGI=;
	b=shYvsTNx1ObJHSYm7y4D6gl9r4s/BdOYyaiBOw9j793Ec2DOVgsO6hUcBLUHVY8SjY
	1GLa8sHT+BRLfWWonF/rtI8DsH4yGTcpToZmPoJnRMZtOOeYRYo50BFmFDoP6aPQuy7x
	3Ba/VZB5VfW7iypiEdP/EAmwsR5DtchPeHW8BhNhpZ3lardAe2IrMKpdtIfOnWTgyLMx
	J32mgA8U2NRH4THggu4XLfAfOZNj52nQ33AV/gRBDoDM/NObhrhdBsZFD5K4KdpLslP7
	8W8WcSz+fChTfgIYcSDGmrHxlhNVvle2mKNcI5S2w2sWJf/Q3u7NEnJwim2DTi28Ad6x
	6viA==
X-Gm-Message-State: APjAAAVo7GonAaxhLREKBY4r7QApsG+bymM/5o034/pgzP1jVUiFjlXr
	g2WPV1xthtwZnKF8oMHWTritTHJieuqjYeagYe8=
X-Google-Smtp-Source: APXvYqzT+F08H19tgi6gFVBhegfk1wEZEmFvDGusVakOA4QAtP5eqstzg7IKQKCsgYDvO760yw11fqmH1p4BEZO8acw=
X-Received: by 2002:a5d:948f:: with SMTP id v15mr13272701ioj.93.1561920155877; 
	Sun, 30 Jun 2019 11:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190620060726.926-1-kraxel@redhat.com>
	<20190620060726.926-12-kraxel@redhat.com>
	<CAPaKu7QXCMMKR50Oiv=CefUA4S+S3KgpJ2FKTd1WA1H2_ORqXg@mail.gmail.com>
	<20190628104907.vign7lmgftrwfisv@sirius.home.kraxel.org>
In-Reply-To: <20190628104907.vign7lmgftrwfisv@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sun, 30 Jun 2019 11:42:25 -0700
Message-ID: <CAPaKu7Skvc6UW+amOz4F8AAW95kXQzMhEJn-v=7kdGqu1dbtxA@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] drm/virtio: switch from ttm to gem shmem helpers
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
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

On Fri, Jun 28, 2019 at 3:49 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > >  static inline struct virtio_gpu_object*
> > >  virtio_gpu_object_ref(struct virtio_gpu_object *bo)
>
> > The last users of these two helpers are removed with this patch.  We
> > can remove them.
>
> patch 12/12 does that.
I meant virtio_gpu_object_ref/unref, which are still around after patch 12.
>
> > > +       bo = gem_to_virtio_gpu_obj(&shmem_obj->base);
> > > +       bo->base.base.funcs = &virtio_gpu_gem_funcs;
> > Move this to virtio_gpu_create_object.
>
> Fixed.
>
> > > +       ret = drm_gem_shmem_pin(&obj->base.base);
> > The bo is attached for its entire lifetime, at least currently.  Maybe
> > we can use drm_gem_shmem_get_pages_sgt (and get rid of obj->pages).
>
> Already checked this.
> We can't due to the iommu quirks.
>
> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
