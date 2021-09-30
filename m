Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914341DB77
	for <lists.virtualization@lfdr.de>; Thu, 30 Sep 2021 15:49:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE6C4607B1;
	Thu, 30 Sep 2021 13:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E6oUST0y88RY; Thu, 30 Sep 2021 13:49:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CE4C1613D7;
	Thu, 30 Sep 2021 13:49:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FF5DC000D;
	Thu, 30 Sep 2021 13:49:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4BF0C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 13:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0F1C840D1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 13:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2CqQhXpApg1Q
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 13:49:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DB1580F13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 13:49:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 603936187A;
 Thu, 30 Sep 2021 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633009777;
 bh=U9iiEkqwLSIMx5qFueAE+WdXrbQNjtowDTehHAGMyMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=arqSlanbgqlgNfeZnJyDO5TTSOWckEPTV6037BqAX1Oo8Dp6/LdUnXNOKFZoLgwX+
 24sWxMcDrtnlE/p2kjHOyZE4vtzM6WKa4tqjc84ZNdsX5z+/euJ/RscKpMwcFl3Frb
 A2IBrCokTmoxJCxJjnoYtyjZxHGiv8AMjacbbWl4=
Date: Thu, 30 Sep 2021 15:49:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 4/6] virtio: Initialize authorized attribute for
 confidential guest
Message-ID: <YVXAb4C51e/L2sGv@kroah.com>
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-5-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065953-mutt-send-email-mst@kernel.org>
 <CAPcyv4hP6mtzKS-CVb-aKf-kYuiLM771PMxN2zeBEfoj6NbctA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4hP6mtzKS-CVb-aKf-kYuiLM771PMxN2zeBEfoj6NbctA@mail.gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>, Linux PCI <linux-pci@vger.kernel.org>,
 X86 ML <x86@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 USB list <linux-usb@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>
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

On Thu, Sep 30, 2021 at 06:36:18AM -0700, Dan Williams wrote:
> On Thu, Sep 30, 2021 at 4:03 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Sep 29, 2021 at 06:05:09PM -0700, Kuppuswamy Sathyanarayanan wrote:
> > > Confidential guest platforms like TDX have a requirement to allow
> > > only trusted devices. By default the confidential-guest core will
> > > arrange for all devices to default to unauthorized (via
> > > dev_default_authorization) in device_initialize(). Since virtio
> > > driver is already hardened against the attack from the un-trusted host,
> > > override the confidential computing default unauthorized state
> > >
> > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> >
> > Architecturally this all looks backwards. IIUC nothing about virtio
> > makes it authorized or trusted. The driver is hardened,
> > true, but this should be set at the driver not the device level.
> 
> That's was my initial reaction to this proposal as well, and I ended
> up leading Sathya astray from what Greg wanted. Greg rightly points
> out that the "authorized" attribute from USB and Thunderbolt already
> exists [1] [2]. So the choice is find an awkward way to mix driver
> trust with existing bus-local "authorized" mechanisms, or promote the
> authorized capability to the driver-core. This patch set implements
> the latter to keep the momentum on the already shipping design scheme
> to not add to the driver-core maintenance burden.
> 
> [1]: https://lore.kernel.org/all/YQuaJ78y8j1UmBoz@kroah.com/
> [2]: https://lore.kernel.org/all/YQzF%2FutgrJfbZuHh@kroah.com/
> 
> > And in particular, not all virtio drivers are hardened -
> > I think at this point blk and scsi drivers have been hardened - so
> > treating them all the same looks wrong.
> 
> My understanding was that they have been audited, Sathya?

Please define "audited" and "trusted" here.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
