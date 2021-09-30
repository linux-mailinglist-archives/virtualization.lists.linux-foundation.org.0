Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7241E01C
	for <lists.virtualization@lfdr.de>; Thu, 30 Sep 2021 19:24:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B2E7401CA;
	Thu, 30 Sep 2021 17:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZwSuGE1wJvIR; Thu, 30 Sep 2021 17:23:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4CE20401CD;
	Thu, 30 Sep 2021 17:23:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1C87C001E;
	Thu, 30 Sep 2021 17:23:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3681CC000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 17:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25CE7606D9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 17:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzmHFHIwSh7N
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 17:23:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88122605C0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 17:23:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AB20613A0;
 Thu, 30 Sep 2021 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633022635;
 bh=5tePxdCWKV6n9abPoiedDR+S/Q6cb3pBjIOwiHhDGUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CgXtKWuOlomRjLMXskRL9wb0BnYsyELUL6upXwxZ0TfFVCT89Jt9Y5Q72o+qxmEEO
 GBflVXV4mLsttSTo8bjOuUBHG5ZxGnlXFDM/TnEmlw6kWmVaZqyFyZbvtQVOzir9SG
 NPfh8I8VF2F9QcuitqSzdMgMtz3j61QxifmcEbyo=
Date: Thu, 30 Sep 2021 19:23:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v2 2/6] driver core: Add common support to skip probe for
 un-authorized devices
Message-ID: <YVXyqBGa5Ix5MzmD@kroah.com>
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-3-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065807-mutt-send-email-mst@kernel.org>
 <YVXBNJ431YIWwZdQ@kroah.com>
 <20210930103537-mutt-send-email-mst@kernel.org>
 <YVXOc3IbcHsVXUxr@kroah.com>
 <20210930105852-mutt-send-email-mst@kernel.org>
 <YVXWIVZupeAzT6bO@kroah.com>
 <f4b5a269-843f-6911-24fe-ebffb2bd4f9e@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4b5a269-843f-6911-24fe-ebffb2bd4f9e@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Jamet <michael.jamet@intel.com>,
 linux-pci@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org,
 Yehezkel Bernat <YehezkelShB@gmail.com>, linux-kernel@vger.kernel.org,
 Andreas Noever <andreas.noever@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "Reshetova, Elena" <elena.reshetova@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-usb@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
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

On Thu, Sep 30, 2021 at 10:17:09AM -0700, Andi Kleen wrote:
> 
> > > The "it" that I referred to is the claim that no driver should be
> > > touching hardware in their module init call. Andi seems to think
> > > such drivers are worth working around with a special remap API.
> > Andi is wrong.
> 
> While overall it's a small percentage of the total, there are still quite a
> few drivers that do touch hardware in init functions. Sometimes for good
> reasons -- they need to do some extra probing to discover something that is
> not enumerated -- sometimes just because it's very old legacy code that
> predates the modern driver model.

Are any of them in the kernel today?

PCI drivers should not be messing with this, we have had well over a
decade to fix that up.

> The legacy drivers could be fixed, but nobody really wants to touch them
> anymore and they're impossible to test.

Pointers to them?

> The drivers that probe something that is not enumerated in a standard way
> have no choice, it cannot be implemented in a different way.

PCI devices are not enumerated in a standard way???

> So instead we're using a "firewall" the prevents these drivers from doing
> bad things by not allowing ioremap access unless opted in, and also do some
> filtering on the IO ports The device filter is still the primary mechanism,
> the ioremap filtering is just belts and suspenders for those odd cases.

That's horrible, don't try to protect the kernel from itself.  Just fix
the drivers.

If you point me at them, I will be glad to have a look and throw some
interns on them.

But really, you all could have fixed them up by now if Intel really
cared about it :(

> If you want we can send an exact list, we did some analysis using a patched
> smatch tool.

Please do.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
