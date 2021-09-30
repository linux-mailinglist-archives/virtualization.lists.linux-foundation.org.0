Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3D41DD58
	for <lists.virtualization@lfdr.de>; Thu, 30 Sep 2021 17:23:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7D01425B1;
	Thu, 30 Sep 2021 15:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gfqj2kGDJS0x; Thu, 30 Sep 2021 15:23:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B6F9E425A9;
	Thu, 30 Sep 2021 15:23:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55D38C001E;
	Thu, 30 Sep 2021 15:23:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81073C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 15:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FD0861401
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 15:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EY0as6ttWcSm
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 15:23:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03E3361400
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 15:23:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33FFA619EE;
 Thu, 30 Sep 2021 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633015402;
 bh=9MrupzJ04PiY8h8aMJkaTmM9e1Ina/USuX9rUwlrYjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y6RLkN+BefH1LZmMQ24S5fWDHxguhbJDPze8ZnYgG946HLg6qtQi72s7o4T4bUbuw
 Yu54jVlP7QXa/SIMSra1Zs5Oug3HhfkZKQ5cazFQSGF9hgvrnM9dOhX+Ra3S3lRm4x
 N8ofc+G0lR5/swJulBVwRbk9xPdbAkLVR/gdn1+k=
Date: Thu, 30 Sep 2021 17:23:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v2 4/6] virtio: Initialize authorized attribute for
 confidential guest
Message-ID: <YVXWaF73gcrlvpnf@kroah.com>
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-5-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065953-mutt-send-email-mst@kernel.org>
 <CAPcyv4hP6mtzKS-CVb-aKf-kYuiLM771PMxN2zeBEfoj6NbctA@mail.gmail.com>
 <6d1e2701-5095-d110-3b0a-2697abd0c489@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d1e2701-5095-d110-3b0a-2697abd0c489@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Andi Kleen <ak@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Jamet <michael.jamet@intel.com>,
 Linux PCI <linux-pci@vger.kernel.org>, X86 ML <x86@kernel.org>,
 virtualization@lists.linux-foundation.org,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>, USB list <linux-usb@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, "Rafael J . Wysocki" <rafael@kernel.org>
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

On Thu, Sep 30, 2021 at 08:18:18AM -0700, Kuppuswamy, Sathyanarayanan wrote:
> 
> 
> On 9/30/21 6:36 AM, Dan Williams wrote:
> > > And in particular, not all virtio drivers are hardened -
> > > I think at this point blk and scsi drivers have been hardened - so
> > > treating them all the same looks wrong.
> > My understanding was that they have been audited, Sathya?
> 
> Yes, AFAIK, it has been audited. Andi also submitted some patches
> related to it. Andi, can you confirm.

What is the official definition of "audited"?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
