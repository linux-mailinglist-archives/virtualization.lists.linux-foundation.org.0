Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C05B15D
	for <lists.virtualization@lfdr.de>; Sun, 30 Jun 2019 20:56:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CE62ED56;
	Sun, 30 Jun 2019 18:56:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A7A99D3D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 18:56:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3EBDD782
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 18:56:48 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id h6so23766160ioh.3
	for <virtualization@lists.linux-foundation.org>;
	Sun, 30 Jun 2019 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NaLfjipo68BMwPOD4vQyPZ7y9beiaLM//1SyGkkxM5c=;
	b=PyWYVlQnOFkdzGkNDuulU3+I3bDzqoT+eDsFc0z4yLtmvtxmJ/GdhMghXfjmwT1xgC
	TF2ruQzrIphDlACAApiQEeYhyAjvzd9h5mL6OOFa/Fn769cuxA7ZA11qLgAm9Ptvd25U
	E2N2W2Cr9L5yzfU5wHxu3NuDf5NxlhNrNwnyDk/BjYS4VzIFKxj6WXXQTdOHmAE7K2Lz
	pUKulussCCkCqtWGc8E6CqaHrupQk5Ud5w5IS+rn82WIjjS4yMDZAy8HYqKwrsufY/ft
	IAvz9rdJ2/e40j98btngjeo7Uf6fSW4vEpir2BhF1wbT1RI5+UiObopDQkJrgn1PMnfT
	lzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NaLfjipo68BMwPOD4vQyPZ7y9beiaLM//1SyGkkxM5c=;
	b=A7pwlon/xIrGI+QhOQMaW8q+dd675A6oy9+NzYpDCDW9BYzNjtvKB+XdyBJyLIMd4i
	9Y38rtF3FTV4ihpsN4hr9mCazD9ZF3ORtg/ScnaO++bWS2Z/l6ss+fFW6C8l4OgrWa4J
	mC2bAnAPo4WWh4HRlhDvmbmMMiiIzxinGsqkl0Uo1s3SAOj+ijw5bKHOkEq2ljClwzqZ
	M1g5svYhw8sLS4mAdhwjYlszhfxVBdp9deqsDZTbJug+i9YPtiRm2ffQ0f5dSanhYe66
	RxBoxZQnjbxAV2dXKG4iEQPeKY0Y40HUVZHarqLUzoHbyzrtXjdaNduYYhTO9dSWBkZA
	MKzw==
X-Gm-Message-State: APjAAAWZKllUfyneEqX+9QWhH39M0f66NZFi8bMwHE2WVjmZU0l/J9ce
	pJPBsuSfXnl4oEOy74e1JRnjrFsYCxlazurKLWg=
X-Google-Smtp-Source: APXvYqyMps6KCRaoTQcQY5rJRYIy3v+QD9VTGz6/p/YraTOJR2mc+l8GXQaEuQN1N1pOBWeesZMvghGdMdaXry7tnuk=
X-Received: by 2002:a02:9f84:: with SMTP id a4mr18440799jam.20.1561921007426; 
	Sun, 30 Jun 2019 11:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190620060726.926-1-kraxel@redhat.com>
	<20190620060726.926-3-kraxel@redhat.com>
	<CAPaKu7RWpoRkTkoatdYHz6itHZFvUYgaBcQAXnSC2gDc+dFZxQ@mail.gmail.com>
	<20190628100516.yrtiuxemyt4hvyra@sirius.home.kraxel.org>
In-Reply-To: <20190628100516.yrtiuxemyt4hvyra@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sun, 30 Jun 2019 11:56:36 -0700
Message-ID: <CAPaKu7QOegd=kzOQMZQcogGSWf1hVqJHuMs-mEX0sRufUhNAcA@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] drm/virtio: switch virtio_gpu_wait_ioctl() to
	gem helper.
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

On Fri, Jun 28, 2019 at 3:05 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Jun 26, 2019 at 04:55:20PM -0700, Chia-I Wu wrote:
> > On Wed, Jun 19, 2019 at 11:07 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > Use drm_gem_reservation_object_wait() in virtio_gpu_wait_ioctl().
> > > This also makes the ioctl run lockless.
> > The userspace has a BO cache to avoid freeing BOs immediately but to
> > reuse them on next allocations.  The BO cache checks if a BO is busy
> > before reuse, and I am seeing a big negative perf impact because of
> > slow virtio_gpu_wait_ioctl.  I wonder if this helps.
>
> Could help indeed (assuming it checks with NOWAIT).
Yeah, that is the case.
>
> How many objects does userspace check in one go typically?  Maybe it
> makes sense to add an ioctl which checks a list, to reduce the system
> call overhead.
One.  The cache sorts BOs by the time they are freed, and checks only
the first (compatible) BO.  If it is idle, cache hit.  Otherwise,
cache miss.  A new ioctl probably won't help.


>
> > > +       if (args->flags & VIRTGPU_WAIT_NOWAIT) {
> > > +               obj = drm_gem_object_lookup(file, args->handle);
> > Don't we need a NULL check here?
>
> Yes, we do.  Will fix.
>
> thanks,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
