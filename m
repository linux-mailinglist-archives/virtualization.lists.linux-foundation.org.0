Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB8D20DD16
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 23:18:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D5C2A87632;
	Mon, 29 Jun 2020 21:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9b91GPCW4Yi; Mon, 29 Jun 2020 21:18:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE93F88382;
	Mon, 29 Jun 2020 21:18:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CAD5C08A0;
	Mon, 29 Jun 2020 21:18:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9CC2C016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 21:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E2EE28805A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 21:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Smrhzb-g0II0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 21:18:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E590687632
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 21:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593465496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YiDtiNB2oFeGuS+CRFVjpgq47fViDI5SfncnPvci6SI=;
 b=PioFVzOu22M6qahmLGk+D2dBJWPt0kZZyRNm6BWT2MOH7D6GUP+BBPGIbw0euJFXJGcIQ7
 YarBiDCE7Vndtd+C0O0/uSPXBTTNktpNDiHwogMKMo4pKIHrLNKiccnVgEYlp1Xt4/0C2g
 xfHqkXGumA3NDH/LQJp/3iTowVTgAP8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-eqUsol7jMJWwFatAN8VH0A-1; Mon, 29 Jun 2020 17:18:14 -0400
X-MC-Unique: eqUsol7jMJWwFatAN8VH0A-1
Received: by mail-wr1-f71.google.com with SMTP id f5so17525525wrv.22
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 14:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YiDtiNB2oFeGuS+CRFVjpgq47fViDI5SfncnPvci6SI=;
 b=tNU6Gt6Q3t5jrT3Y7rKQZlIdMulqqt0BBErHykxT8WllEsjDW4jW3CZ+jCUcoh2L0O
 MdPh6TMNTfXPTzkC4Tq1vAXVDjMAGWdUm+sjyIS0ycnk4pQeHeWjiDhDUsJjd5DUJReQ
 ZrVpAC551MXAZw06mdoPJ+I7Zb1+RD+L2ETnusztCVNf79kUUvyBxCJWE+Cp2ZbEHJLR
 JAsVUL1nO+5EAEoWx7ffKVl4grIpXe5t7IJTk0FmHhitcUuXrXL0RcqGAeLTCDFbeE0q
 i41we4GEQgrAPIRoyE56cdi5x4iKvdgmffzCtSh+2bUkJ9z1Hzn30QT4PKA5KGGtsO/d
 wXhA==
X-Gm-Message-State: AOAM5319/juBlwSVvF8CkgkzL/fOE/Gyc3LMOvX4oklaxOSwGmhw54BN
 xnqEmyhk4WXzzwzUnTpkhS0ok8cHQJ2XUwDCi104hNnzdbjlBQTIfA9B3G82KEqMwrFJPVcFC5G
 fj/36t6bSPU+G7U/XEth5VNprUqVNWKejbrly9KOgKg==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr18539551wml.33.1593465493744; 
 Mon, 29 Jun 2020 14:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzfgRem+KXercJkxWwHYUfzWnoeVDCjjDW1dg0ezKr2F2J/LJYjbsk39o6uhlbY8GuP56chg==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr18539534wml.33.1593465493510; 
 Mon, 29 Jun 2020 14:18:13 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 c25sm1063645wml.46.2020.06.29.14.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 14:18:12 -0700 (PDT)
Date: Mon, 29 Jun 2020 17:18:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
Message-ID: <20200629171241-mutt-send-email-mst@kernel.org>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
 <20200629115952-mutt-send-email-mst@kernel.org>
 <66f808f2-5dd9-9127-d0e8-6bafbf13fc62@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <66f808f2-5dd9-9127-d0e8-6bafbf13fc62@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 kvm@vger.kernel.org, thomas.lendacky@amd.com, heiko.carstens@de.ibm.com,
 cohuck@redhat.com, linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, david@gibson.dropbear.id.au
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

On Mon, Jun 29, 2020 at 06:48:28PM +0200, Pierre Morel wrote:
> 
> 
> On 2020-06-29 18:09, Michael S. Tsirkin wrote:
> > On Wed, Jun 17, 2020 at 12:43:57PM +0200, Pierre Morel wrote:
> > > An architecture protecting the guest memory against unauthorized host
> > > access may want to enforce VIRTIO I/O device protection through the
> > > use of VIRTIO_F_IOMMU_PLATFORM.
> > > Let's give a chance to the architecture to accept or not devices
> > > without VIRTIO_F_IOMMU_PLATFORM.
> > 
> > I agree it's a bit misleading. Protection is enforced by memory
> > encryption, you can't trust the hypervisor to report the bit correctly
> > so using that as a securoty measure would be pointless.
> > The real gain here is that broken configs are easier to
> > debug.
> > 
> > Here's an attempt at a better description:
> > 
> > 	On some architectures, guest knows that VIRTIO_F_IOMMU_PLATFORM is
> > 	required for virtio to function: e.g. this is the case on s390 protected
> > 	virt guests, since otherwise guest passes encrypted guest memory to devices,
> > 	which the device can't read. Without VIRTIO_F_IOMMU_PLATFORM the
> > 	result is that affected memory (or even a whole page containing
> > 	it is corrupted). Detect and fail probe instead - that is easier
> > 	to debug.
> 
> Thanks indeed better aside from the "encrypted guest memory": the mechanism
> used to avoid the access to the guest memory from the host by s390 is not
> encryption but a hardware feature denying the general host access and
> allowing pieces of memory to be shared between guest and host.

s/encrypted/protected/

> As a consequence the data read from memory is not corrupted but not read at
> all and the read error kills the hypervizor with a SIGSEGV.

s/(or even a whole page containing it is corrupted)/can not be
	read and the read error kills the hypervizor with a SIGSEGV/


As an aside, we could maybe handle that more gracefully
on the hypervisor side.

> 
> > 
> > however, now that we have described what it is (hypervisor
> > misconfiguration) I ask a question: can we be sure this will never
> > ever work? E.g. what if some future hypervisor gains ability to
> > access the protected guest memory in some abstractly secure manner?
> 
> The goal of the s390 PV feature is to avoid this possibility so I don't
> think so; however, there is a possibility that some hardware VIRTIO device
> gain access to the guest's protected memory, even such device does not exist
> yet.
> 
> At the moment such device exists we will need a driver for it, at least to
> enable the feature and apply policies, it is also one of the reasons why a
> hook to the architecture is interesting.


Not neessarily, it could also be fully transparent. See e.g.
recent AMD andvances allowing unmodified guests with SEV.


> > We are blocking this here, and it's hard to predict the future,
> > and a broken hypervisor can always find ways to crash the guest ...
> 
> yes, this is also something to fix on the hypervizor side, Halil is working
> on it.
> 
> > 
> > IMHO it would be safer to just print a warning.
> > What do you think?
> 
> Sadly, putting a warning may not help as qemu is killed if it accesses the
> protected memory.
> Also note that the crash occurs not only on start but also on hotplug.
> 
> Thanks,
> Pierre

Well that depends on where does the warning go. If it's on a serial port
it might be reported host side before the crash triggers.  But
interesting point generally. How about a feature to send a warning code
or string to host then?

> -- 
> Pierre Morel
> IBM Lab Boeblingen

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
