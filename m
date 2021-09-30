Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE6141DB84
	for <lists.virtualization@lfdr.de>; Thu, 30 Sep 2021 15:53:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9D3640200;
	Thu, 30 Sep 2021 13:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7VfDgf5j1xO; Thu, 30 Sep 2021 13:52:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 828B0400F0;
	Thu, 30 Sep 2021 13:52:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20255C000D;
	Thu, 30 Sep 2021 13:52:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B33C1C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 13:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F22E613D3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 13:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cw1IXSzbiaj7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 13:52:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C789B6002E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 13:52:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA12661440;
 Thu, 30 Sep 2021 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633009975;
 bh=L0oLqFNbkPrIbGt+hPB4rGpaRUbo+2TxQ+488ZyaDGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=deDtdNm2iRzr+xP15sd2vlWMXOpveccNMKkbD3Jx58CbdPRS2Dm3uDK68oBqpaN3f
 IabfV6uV1vpdH6bf0N9RAghufVCjXRZweWO+RKN7Mz9mgWu4SCBOLPa5+jDw/m0mGc
 08AfqNv9wGtLprXDPkT3itEA6jaoWZT5svVNdl2s=
Date: Thu, 30 Sep 2021 15:52:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/6] driver core: Add common support to skip probe for
 un-authorized devices
Message-ID: <YVXBNJ431YIWwZdQ@kroah.com>
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-3-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065807-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930065807-mutt-send-email-mst@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, linux-pci@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux-foundation.org,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>, linux-kernel@vger.kernel.org,
 Andreas Noever <andreas.noever@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>
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

On Thu, Sep 30, 2021 at 06:59:36AM -0400, Michael S. Tsirkin wrote:
> On Wed, Sep 29, 2021 at 06:05:07PM -0700, Kuppuswamy Sathyanarayanan wrote:
> > While the common case for device-authorization is to skip probe of
> > unauthorized devices, some buses may still want to emit a message on
> > probe failure (Thunderbolt), or base probe failures on the
> > authorization status of a related device like a parent (USB). So add
> > an option (has_probe_authorization) in struct bus_type for the bus
> > driver to own probe authorization policy.
> > 
> > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> 
> 
> So what e.g. the PCI patch
> https://lore.kernel.org/all/CACK8Z6E8pjVeC934oFgr=VB3pULx_GyT2NkzAogdRQJ9TKSX9A@mail.gmail.com/
> actually proposes is a list of
> allowed drivers, not devices. Doing it at the device level
> has disadvantages, for example some devices might have a legacy
> unsafe driver, or an out of tree driver. It also does not
> address drivers that poke at hardware during init.

Doing it at a device level is the only sane way to do this.

A user needs to say "this device is allowed to be controlled by this
driver".  This is the trust model that USB has had for over a decade and
what thunderbolt also has.

> Accordingly, I think the right thing to do is to skip
> driver init for disallowed drivers, not skip probe
> for specific devices.

What do you mean by "driver init"?  module_init()?

No driver should be touching hardware in their module init call.  They
should only be touching it in the probe callback as that is the only
time they are ever allowed to talk to hardware.  Specifically the device
that has been handed to them.

If there are in-kernel PCI drivers that do not do this, they need to be
fixed today.

We don't care about out-of-tree drivers for obvious reasons that we have
no control over them.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
