Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5352C0E8C
	for <lists.virtualization@lfdr.de>; Mon, 23 Nov 2020 16:18:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8A5788612E;
	Mon, 23 Nov 2020 15:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tiMr9NxtsI4y; Mon, 23 Nov 2020 15:18:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E837386141;
	Mon, 23 Nov 2020 15:18:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C05ECC0052;
	Mon, 23 Nov 2020 15:18:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2433C0052
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 15:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CBD67870EE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 15:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BrPBvt0mo978
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 15:18:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 920CA870EA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606144687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gjysr2TGm2BHd6PEXB4bmvN9WC4d9mZ2jNM8y3Hhwb0=;
 b=Xah1o01dFT+wqRq3ggLLKE+OwXADT0/eqBLfkcnn6ExinElPaKu2efEQTYtZiNb06tFAsk
 aB0onpYk7nNCtK14qYitHEauzlIcq4eAheWQNRiBdPcFXRIrgRsPZzwaIGNMfIHxGosNQm
 EjIwmdjALgdlrnLoa7Y+jYMD1+vb90g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-_xVwFG3ROuy4QUNac_1Pgw-1; Mon, 23 Nov 2020 10:18:04 -0500
X-MC-Unique: _xVwFG3ROuy4QUNac_1Pgw-1
Received: by mail-wm1-f70.google.com with SMTP id g125so1664350wme.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 07:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gjysr2TGm2BHd6PEXB4bmvN9WC4d9mZ2jNM8y3Hhwb0=;
 b=PLA4cH6agFeh7UD1MpumASlQAEjbyxrWBCCeC1JIGsSGcPc//AoWuwlMhzuVRbOIkr
 eZWouGoc/v7ZvESe/2H7iwBEEa/cn5fNrLa+O8aM+Bg0IHlqGb8ym5qWgoXT93YjDlcw
 Lew5SjV8UhDR/+tNTkMK451d8b2YoVOBp6hR+MPW/iANQy6UTn4kjDEbZ9MaoUVZ3hFd
 16odsuSWmQ0GHeBLmKksZIZKvCv88hFkdIBw0fKs7+oYNxzOyQvZrfwsb2sK1Jgf4HUH
 n8rAZbDJUJf0A2wt9SCUJUGCXcm5YKyVp1wGRI8QsTUlelDBpFl184sUvQWUbh2H4PdW
 DSFw==
X-Gm-Message-State: AOAM533TWhaNrLdoD9QXwiimJiuaC1lPJ88QD8VQe1CTxGXX/CJjGb73
 fjRSxbu4UP9yNnlmw3IZr1v17TWYanNbGOrM/P+zV1vzZqmAdA6XHjZgDZ0u05cbC2HZlEmPfb3
 YUBuLwRkxxOT22dVbnqtBYusCIUOLpqybENniwQS2zA==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr145423wrn.190.1606144683206; 
 Mon, 23 Nov 2020 07:18:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2R4lL1Mq2Y1aVC5dDdaeyjFkJP6dOyeHTSlEN3C3ieAvijxPn9ns3PNbleWjgoJ6rtHRlSg==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr145403wrn.190.1606144682981; 
 Mon, 23 Nov 2020 07:18:02 -0800 (PST)
Received: from steredhat (host-79-17-248-175.retail.telecomitalia.it.
 [79.17.248.175])
 by smtp.gmail.com with ESMTPSA id n4sm15266610wmc.30.2020.11.23.07.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 07:18:02 -0800 (PST)
Date: Mon, 23 Nov 2020 16:17:58 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
Message-ID: <20201123151758.5bik46pu4aqrtmd5@steredhat>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <20201117164043.GS131917@stefanha-x1.localdomain>
 <b3343762-bb11-b750-46ec-43b5556f2b8e@oracle.com>
 <20201118113117.GF182763@stefanha-x1.localdomain>
 <20201119094315-mutt-send-email-mst@kernel.org>
 <ceebdc90-3ffc-1563-ff85-12a848bcba18@oracle.com>
 <CAJSP0QUvSwX5NCPmfSODV_C+D41E21LZT=oXQ2PLc6baAsGGDQ@mail.gmail.com>
 <ffd88f0c-981e-a102-4b08-f29d6b9a0f71@oracle.com>
 <CAJSP0QUfqd=QNFa-RikH4dVcLmfcP-pYCwznP3W0zobYkM+KDw@mail.gmail.com>
 <CAJSP0QVu4P6c+kdFkhw1S_OEaj7B-eiDqFOVDxWAaSOcsAADrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJSP0QVu4P6c+kdFkhw1S_OEaj7B-eiDqFOVDxWAaSOcsAADrA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: fam <fam@euphon.net>, linux-scsi <linux-scsi@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 target-devel <target-devel@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mike Christie <michael.christie@oracle.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Nov 20, 2020 at 08:45:49AM +0000, Stefan Hajnoczi wrote:
>On Thu, Nov 19, 2020 at 5:08 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> On Thu, Nov 19, 2020 at 4:43 PM Mike Christie
>> <michael.christie@oracle.com> wrote:
>> >
>> > On 11/19/20 10:24 AM, Stefan Hajnoczi wrote:
>> > > On Thu, Nov 19, 2020 at 4:13 PM Mike Christie
>> > > <michael.christie@oracle.com> wrote:
>> > >>
>> > >> On 11/19/20 8:46 AM, Michael S. Tsirkin wrote:
>> > >>> On Wed, Nov 18, 2020 at 11:31:17AM +0000, Stefan Hajnoczi wrote:
>> > > struct vhost_run_worker_info {
>> > >      struct timespec *timeout;
>> > >      sigset_t *sigmask;
>> > >
>> > >      /* List of virtqueues to process */
>> > >      unsigned nvqs;
>> > >      unsigned vqs[];
>> > > };
>> > >
>> > > /* This blocks until the timeout is reached, a signal is received, or
>> > > the vhost device is destroyed */
>> > > int ret = ioctl(vhost_fd, VHOST_RUN_WORKER, &info);
>> > >
>> > > As you can see, userspace isn't involved with dealing with the
>> > > requests. It just acts as a thread donor to the vhost driver.
>> > >
>> > > We would want the VHOST_RUN_WORKER calls to be infrequent to avoid the
>> > > penalty of switching into the kernel, copying in the arguments, etc.
>> >
>> > I didn't get this part. Why have the timeout? When the timeout expires,
>> > does userspace just call right back down to the kernel or does it do
>> > some sort of processing/operation?
>> >
>> > You could have your worker function run from that ioctl wait for a
>> > signal or a wake up call from the vhost_work/poll functions.
>>
>> An optional timeout argument is common in blocking interfaces like
>> poll(2), recvmmsg(2), etc.
>>
>> Although something can send a signal to the thread instead,
>> implementing that in an application is more awkward than passing a
>> struct timespec.
>>
>> Compared to other blocking calls we don't expect
>> ioctl(VHOST_RUN_WORKER) to return soon, so maybe the timeout will
>> rarely be used and can be dropped from the interface.
>>
>> BTW the code I posted wasn't a carefully thought out proposal :). The
>> details still need to be considered and I'm going to be offline for
>> the next week so maybe someone else can think it through in the
>> meantime.
>
>One final thought before I'm offline for a week. If
>ioctl(VHOST_RUN_WORKER) is specific to a single vhost device instance
>then it's hard to support poll-mode (busy waiting) workers because
>each device instance consumes a whole CPU. If we stick to an interface
>where the kernel manages the worker threads then it's easier to share
>workers between devices for polling.

Agree, ioctl(VHOST_RUN_WORKER) is interesting and perhaps simplifies 
thread management (pinning, etc.), but with kthread would be easier to 
implement polling sharing worker with multiple devices.

>
>I have CCed Stefano Garzarella, who is looking at similar designs for
>vDPA software device implementations.

Thanks, Mike please can you keep me in CC for this work?

It's really interesting since I'll have similar issues to solve with 
vDPA software device.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
