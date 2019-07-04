Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6571F5FD19
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 20:46:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7F99CCF6;
	Thu,  4 Jul 2019 18:46:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CFA33CD9
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 18:46:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6DB8387C
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 18:46:24 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m24so5025908ioo.2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 04 Jul 2019 11:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/EL1KLCRFQKW2ACCFaTqozaezf7EHz4hHVM/un1EcE4=;
	b=t5F5YNcug6hMseo0CGrmu4jtrScYyR5ptz8hoGQXZ2nAYmqEbnWUkptDsisVRn+DlR
	CwihM32a+oNgurJg0qF/nDO/Z7Use2bWSvL/B+Rs/djchh2zDLEkloovdGI54dEmg7Z7
	0ZcLtk9dxbf4JWb2t6EWq1MMcGyaVhvNZG3gucduuo5SYzlm2Ej4EDjeXGg2fUYsONWY
	wVSxZ+NiAJAy8IT861ZE5CZnGHPrrz8tDjXqwYFHsv145C6cr2YShpRTl8W7KSNlzkUK
	tR5Qy2gVPZtMNqRb6vSFgLcjAmVZ/dcSvndnrTJdKezTc/nvPEShNL2J6I+hSa2Pwbck
	a/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/EL1KLCRFQKW2ACCFaTqozaezf7EHz4hHVM/un1EcE4=;
	b=fIphrk4hcS+/cbQXq8n0/ZC+/5z3Nl2TFtzdbT6ECj74cjGYitisBRXURR8AyKQ8rU
	0+RouT8NilWYuk14O6tCp/jfkFsIau+/yF5puRZt6p7suemGmxmDpYGXlGY2gTsrXGF2
	XFRDYpCxEMQGKSI9tPm4pM4jSHKXa6w/kGlavlTH0Gc3NYhaBimuxMsWaEskSMKmJC8F
	umXZccqLM9bTyV7gA0qN8wBx5j5G1SX/iAd1gHHeOPFbjC/jVm3P1skyVDNo/1iswuBM
	GTAsgO42+eokQK9ytkbxa/ZYo1allKXMy6uexdmermxHb1W0A4eYRCS2gawNDgeiHP95
	V7eg==
X-Gm-Message-State: APjAAAUQDjtLOJddJ3JILQxGJAL9FpWNoW9fghYnqsUt1UF7Okeq/j6/
	0AOuBf5FhOyFrGWWyEn1p92zvzx/gXlcy6rGbQw=
X-Google-Smtp-Source: APXvYqw068LIiSNZG8tw6hH1iAgU3f8oV5wzSRuRWNvDNz3EezgtI9aQEHP/lGGiQvDKG3BtZpOWd1VgboUZlM9JGhc=
X-Received: by 2002:a05:6602:104:: with SMTP id
	s4mr39068278iot.200.1562265983623; 
	Thu, 04 Jul 2019 11:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-9-kraxel@redhat.com>
	<CAPaKu7QP=A2kV_kqcT20Pmc831HviaBJN1RpOFoa=V1g6SmE_g@mail.gmail.com>
	<20190704112534.v7icsuverf7wrbjq@sirius.home.kraxel.org>
In-Reply-To: <20190704112534.v7icsuverf7wrbjq@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Jul 2019 11:46:12 -0700
Message-ID: <CAPaKu7SQS5USJf0Y+K41tuRA=4qZJf5CnTu9EqAPZvz+GJCP2w@mail.gmail.com>
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

On Thu, Jul 4, 2019 at 4:25 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > >         if (fence)
> > >                 virtio_gpu_fence_emit(vgdev, hdr, fence);
> > > +       if (vbuf->objs) {
> > > +               virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
> > > +               virtio_gpu_array_unlock_resv(vbuf->objs);
> > > +       }
> > This is with the spinlock held.  Maybe we should move the
> > virtio_gpu_array_unlock_resv call out of the critical section.
>
> That would bring back the race ...
Right...
>
> > I am actually more concerned about virtio_gpu_array_add_fence, but it
> > is also harder to move.  Should we add a kref to the object array?
>
> Yep, refcounting would be the other way to fix the race.
>
> > This bothers me because I recently ran into a CPU-bound game with very
> > bad lock contention here.
>
> Hmm.  Any clue where this comes from?  Multiple threads competing for
> virtio buffers I guess?  Maybe we should have larger virtqueues?
The game was single-threaded.  I guess it was the game and Xorg
competing for virtio buffers.  That was also on an older kernel
without explicit fences.  The userspace had to create dummy resources
frequently to do VIRTIO_IOCTL_RESOURCE_WAIT.

I think this is fine for now as far as I am concerned.  I can look
into this more closely after this series lands.


>
> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
