Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 237346503E
	for <lists.virtualization@lfdr.de>; Thu, 11 Jul 2019 04:43:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F0F694B28;
	Thu, 11 Jul 2019 02:43:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 133F3494B
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 02:35:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 82087DF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 02:35:53 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id f4so9227157ioh.6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 19:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C1FC0kkhG8SE4KxZI9/vd1vvZYlqKizf2ehICOMyQFw=;
	b=gZuX85ZCmj/43wOQW8QDrAr8gsP1kGWGDwQXP7ruMAHyiaKt3g7NjtaA+MEVdHmPOT
	wKDPWmEBpa83TiEvIwO+ugF++ClLRUvAzQLBP51kB4e6VSC6Snkjk3d4n8a6/wkm9/Ra
	D7155hJwNevtJn/VruKCuIazOesSrERBBV8vHwGFFkNSHxznLmqbfHO6yEdsHe98bC30
	T7PKRJ7+sCT5Xa2XQQwi9kRh5LcipaXeyRjPVyu6OVHm/E8NeQJY6UH3Mv4YtROKhPbf
	uYVC+T7pV39I8wXcfcxdqZB0y5IdoQR5bzuyil6Rc7DsmYrELvsBAixhWonuRgUpjKBt
	FjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C1FC0kkhG8SE4KxZI9/vd1vvZYlqKizf2ehICOMyQFw=;
	b=SjSjG67wKVIO+T7Y+GQJV+hPRlKkZZKobaBuTKN9e60eikXtOEiHKVQlZ0aoh7uA/s
	/ElLysNos/WxYSOEcL98cCPngxspe3DnEXx71kOx/X/fwyjSr2dXHnmE5sgKAcvAY8fQ
	uHxx1NzCVQoH9s4eAceOQUuk4R2sB5dTmDEHyrqNZ+rxMCvPnO6udrHGY/QWJAP+0Ibx
	CJu9KDuONBMraXPlbxOS2bLwb4isOqU8nT08xHqTB8wUvBX48hm2bonJ8Mm3DMps716w
	3dmRqbHj5Sl/HH8++cOK1Kjo4tYvc1KwQnbJ5OfSOjiX3XqOZvlOhCKpSyQaCsy3ubnN
	giKw==
X-Gm-Message-State: APjAAAVP7m3Q8C6llnjRHDB+jaQvlCOgRgHrcl1/OKtYZVaaekXRfR9z
	HfFL0AMGAxBmshs5o4arND30+rBV1/7OS4ThhuM=
X-Google-Smtp-Source: APXvYqySOQ0NQmFWxVA1kPgmyB8lKtJqH6UcCGrrUDZnNcuPCHHrmvDjUvwMLLqlPMPNkYUmdbrvZzQlXxg4BT1y+pw=
X-Received: by 2002:a5d:8e08:: with SMTP id e8mr1665361iod.139.1562812552660; 
	Wed, 10 Jul 2019 19:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-9-kraxel@redhat.com>
	<CAPaKu7QP=A2kV_kqcT20Pmc831HviaBJN1RpOFoa=V1g6SmE_g@mail.gmail.com>
	<20190704112534.v7icsuverf7wrbjq@sirius.home.kraxel.org>
	<CAPaKu7SQS5USJf0Y+K41tuRA=4qZJf5CnTu9EqAPZvz+GJCP2w@mail.gmail.com>
In-Reply-To: <CAPaKu7SQS5USJf0Y+K41tuRA=4qZJf5CnTu9EqAPZvz+GJCP2w@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 10 Jul 2019 19:35:41 -0700
Message-ID: <CAPaKu7RQo8T81iGtPbtgmv7WtV-uDO9+BsT3vMd=iggZ0Q_Yew@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] drm/virtio: rework virtio_gpu_execbuffer_ioctl
	fencing
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Gurchetan Singh <gurchetansingh@chromium.org>
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

On Thu, Jul 4, 2019 at 11:46 AM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Thu, Jul 4, 2019 at 4:25 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > >         if (fence)
> > > >                 virtio_gpu_fence_emit(vgdev, hdr, fence);
> > > > +       if (vbuf->objs) {
> > > > +               virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
> > > > +               virtio_gpu_array_unlock_resv(vbuf->objs);
> > > > +       }
> > > This is with the spinlock held.  Maybe we should move the
> > > virtio_gpu_array_unlock_resv call out of the critical section.
> >
> > That would bring back the race ...
> Right...
> >
> > > I am actually more concerned about virtio_gpu_array_add_fence, but it
> > > is also harder to move.  Should we add a kref to the object array?
> >
> > Yep, refcounting would be the other way to fix the race.
> >
> > > This bothers me because I recently ran into a CPU-bound game with very
> > > bad lock contention here.
> >
> > Hmm.  Any clue where this comes from?  Multiple threads competing for
> > virtio buffers I guess?  Maybe we should have larger virtqueues?
> The game was single-threaded.  I guess it was the game and Xorg
> competing for virtio buffers.  That was also on an older kernel
> without explicit fences.  The userspace had to create dummy resources
> frequently to do VIRTIO_IOCTL_RESOURCE_WAIT.
>
> I think this is fine for now as far as I am concerned.  I can look
> into this more closely after this series lands.
It was virtio_gpu_dequeue_ctrl_func who wanted to grab the lock to
handle the responses.  I sent a patch for it

  https://patchwork.freedesktop.org/series/63529/

>
>
> >
> > cheers,
> >   Gerd
> >
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
