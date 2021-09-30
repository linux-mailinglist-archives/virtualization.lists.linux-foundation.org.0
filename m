Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ACD41E2DF
	for <lists.virtualization@lfdr.de>; Thu, 30 Sep 2021 22:53:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 711E040478;
	Thu, 30 Sep 2021 20:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MxFpnrLWuYQi; Thu, 30 Sep 2021 20:53:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3EA0740475;
	Thu, 30 Sep 2021 20:53:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3506C000D;
	Thu, 30 Sep 2021 20:53:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBC6CC000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 20:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA9B440475
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 20:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNzVkPm1XXp0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 20:53:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3B0640474
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 20:53:09 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id v19so5070794pjh.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 13:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qejnfdUY8QWELT35ESORodSvftZM3gHJyDt93Qq8uI=;
 b=CUV7eUpdDe63xSCyeA5r9yN4N81HMfi00d9dCTu2g6Y1QDXRMIKSN7KVxpOpex4R4G
 pLTEfol+/8HIkj80GwEeD3mLgeXqDqiPvHeQ5l1tWfx0ImoZw0Zx2zcVEr8E0ZCjUzHM
 gvkScgFJ0p80ga65nSCzha0vGzMCgwbTmCtT3wuBUj9EB2kEgh1CtMcVUzGxVerYQF+U
 J8nlGmdESK2QB3GBZCKwqIMn7p3kXDe4lPSVvFYqLvvvYpa8hSwM3J9Ba6OfkoIKBIQH
 bqn4zl1Hz2+Ywd5H94eavdUwBAhhFF2uACxiWEWUL4gAFa0kAd+416a9ZlRoWtHW6Ll4
 L1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qejnfdUY8QWELT35ESORodSvftZM3gHJyDt93Qq8uI=;
 b=AnH+Rsb2WuOrKlGqz33OJHQMT+UM94M7+hUTqnIn5g22zCfELM6NoDhLGKIQo5XPfY
 tYjQxYiqy2QUe6chhQUDy9S20vfn435PJOOktD17O+wZbdQrVUE9xGZKbEBMk5o5qz4U
 7X0NUejiJwfcIbLoohZBetlJqbVUJOmMdA9IYqszJMbgJKC4RHvYJRWPuPSi/W1wdQvM
 C04ly4vKlBZI/oXj4a3vx+vj++D/3iWT+jkGFESJESkP6FvqIujBm9TQSOfXSxnPj7Ve
 mgU7LyJt9Rgg65UPrQ8u2GOrYM/7o/Mz9VXRzs5/NLwu4zVWTGDeyFRKt6aVzRp3tLaU
 hfuQ==
X-Gm-Message-State: AOAM532vu4JGcz4CrLhwfWYIxTAh5VOjZOzNzU9sJLxQY3JDB/A8G1ZS
 XfAszzqukjp27WqdAYuQcXK0SbqpiwHDB+5qji6LGg==
X-Google-Smtp-Source: ABdhPJxO5ZRL2F463Ble7fhX3kBlKD2hVMBPqBF5zNBEMi6BOkVEi8Omb9sco1NJAISIFCO6t8sjObGDAHXQjZOa7bE=
X-Received: by 2002:a17:902:e80f:b0:13b:721d:f750 with SMTP id
 u15-20020a170902e80f00b0013b721df750mr6161717plg.18.1633035189290; Thu, 30
 Sep 2021 13:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-3-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065807-mutt-send-email-mst@kernel.org> <YVXBNJ431YIWwZdQ@kroah.com>
 <20210930144305.GA464826@rowland.harvard.edu>
 <20210930104924-mutt-send-email-mst@kernel.org>
 <20210930153509.GF464826@rowland.harvard.edu>
 <20210930115243-mutt-send-email-mst@kernel.org>
 <00156941-300d-a34a-772b-17f0a9aad885@linux.intel.com>
 <20210930204447.GA482974@rowland.harvard.edu>
In-Reply-To: <20210930204447.GA482974@rowland.harvard.edu>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 30 Sep 2021 13:52:59 -0700
Message-ID: <CAPcyv4j8DvsMYppRtm=+JQWc7nJGoXeAGGz9U150x0p_KekqcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] driver core: Add common support to skip probe for
 un-authorized devices
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Linux PCI <linux-pci@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Andreas Noever <andreas.noever@gmail.com>, "Reshetova,
 Elena" <elena.reshetova@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Andi Kleen <ak@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 X86 ML <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>
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

On Thu, Sep 30, 2021 at 1:44 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, Sep 30, 2021 at 12:23:36PM -0700, Andi Kleen wrote:
> >
> > > I don't think the current mitigations under discussion here are about
> > > keeping the system working. In fact most encrypted VM configs tend to
> > > stop booting as a preferred way to handle security issues.
> >
> > Maybe we should avoid the "trusted" term here. We're only really using it
> > because USB is using it and we're now using a common framework like Greg
> > requested. But I don't think it's the right way to think about it.
> >
> > We usually call the drivers "hardened". The requirement for a hardened
> > driver is that all interactions through MMIO/port/config space IO/MSRs are
> > sanitized and do not cause memory safety issues or other information leaks.
> > Other than that there is no requirement on the functionality. In particular
> > DOS is ok since a malicious hypervisor can decide to not run the guest at
> > any time anyways.
> >
> > Someone loading an malicious driver inside the guest would be out of scope.
> > If an attacker can do that inside the guest you already violated the
> > security mechanisms and there are likely easier ways to take over the guest
> > or leak data.
> >
> > The goal of the device filter mechanism is to prevent loading unhardened
> > drivers that could be exploited without them being themselves malicious.
>
> If all you want to do is prevent someone from loading a bunch of
> drivers that you have identified as unhardened, why not just use a
> modprobe blacklist?  Am I missing something?

modules != drivers (i.e. multi-driver modules are a thing) and builtin
modules do not adhere to modprobe policy.

There is also a desire to be able to support a single kernel image
across hosts and guests. So, if you were going to say, "just compile
all unnecessary drivers as modules" that defeats the common kernel
image goal. For confidential computing the expectation is that the
necessary device set is small. As you can see in the patches in this
case it's just a few lines of PCI ids and a hack to the virtio bus to
achieve the goal of disabling all extraneous devices by default.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
