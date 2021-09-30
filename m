Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A53741E1F6
	for <lists.virtualization@lfdr.de>; Thu, 30 Sep 2021 21:05:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E526383F68;
	Thu, 30 Sep 2021 19:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veNiI_qMor7A; Thu, 30 Sep 2021 19:05:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CA7C3841C1;
	Thu, 30 Sep 2021 19:05:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 641D5C000D;
	Thu, 30 Sep 2021 19:05:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1303C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 19:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F789407C9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 19:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6f63UAjhR_S
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 19:04:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4423140181
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 19:04:59 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id x4so4714106pln.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 12:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sq8sxX34+Grk9aluOB8rkcRM/zE/YFO/Um/RRIXvef8=;
 b=s/T3WxfqzLIySudeP/owpLxq0XbQ9h42h5F7XrkwCn4prX8sTpXGFoMMBQEd83MEIO
 PqCfeU5PCR/yXXo8r2wkJsenE9iYQW3XUGx9MxaLkqME25QYBbLFpQJYiWOn4hiRACoh
 TJTllOTyNgPfQ7b9UG0eAMROQIsdnsOOQLeGFOHh4nt4wRQ+vrnlctfEQ08G98STFuWP
 qLdkCHCNKhyiGBu0trjL4UwUD50kT9W2dH5iUiz2nPBj+9HEjuN51lacErFVKXtN9JSC
 xcQDxkXyP+/M/tLt4zoE3m/gxpHZUzIDNDdNOIfZ/PDoN/MMbSNvUBl5RG6cxna3nM0m
 Z6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sq8sxX34+Grk9aluOB8rkcRM/zE/YFO/Um/RRIXvef8=;
 b=kwNr5FH6Ltm/yDFz22thkHgLGnUKY1CvS3dTuHY5DWyWXTJRwsH7a01x3F9ZDlG0Du
 v27D8jFVSFMY5oRW3pDHvL3QAhngcxXl3wKa4PQnZSRJdYGD4xo67/ZRsNvAOh8PHFuO
 O596pDv9Xd9Ww9lRZH75oUk87mHxs2EKnT/42dYQ9muvEmEH3HdWoVhsxZp6YyWA+ELX
 inn23vFwqyNf5cgyp4Y6amMTb9WNUzPIJXarQT3FKGeRX8GQ0TkfkmE+bUgjVCB9KaHV
 +BMzuCeW4n10ZZfwn+7E7WvjNr42fgK308wewT/olA/KZJt2n+59aWb3q1Rxz4mmL+Vo
 Iz+Q==
X-Gm-Message-State: AOAM53148wz2b9una2TXDlvtLV37ydU9i87mqfwcG5EMlcssRB35Ac26
 +g2QXlBzNszLQMm7TKqCyd9tYLPXUNMd21/mWH4YEQ==
X-Google-Smtp-Source: ABdhPJzucKENnq7XhWDMviPOqEM8S2r1dBq8hNkP1imn+5HTl7kkb9fVxFNHk9g2RaqssOmOJEEGC/f7665XrQLlAAg=
X-Received: by 2002:a17:90b:3ec3:: with SMTP id
 rm3mr7268323pjb.93.1633028698606; 
 Thu, 30 Sep 2021 12:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-2-sathyanarayanan.kuppuswamy@linux.intel.com>
 <CA+CmpXtXn5wjxwow5va5u9qHcQDLkd4Sh2dcqB545SXaxV1GkQ@mail.gmail.com>
 <CAPcyv4iNp41mZcpzGCPR9Xty83j+abk_SOxvsx1xaQ8wALRv0Q@mail.gmail.com>
 <CA+CmpXvGCAny-WHGioJQHF9ZZ5pCaR-E_rw5oeE82xC30naVXg@mail.gmail.com>
In-Reply-To: <CA+CmpXvGCAny-WHGioJQHF9ZZ5pCaR-E_rw5oeE82xC30naVXg@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 30 Sep 2021 12:04:48 -0700
Message-ID: <CAPcyv4ixqiMw1KTB8rbzzrtaErV4PT3R3XqshHhAXv6Ohjzs1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] driver core: Move the "authorized" attribute from
 USB/Thunderbolt to core
To: Yehezkel Bernat <yehezkelshb@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 virtualization@lists.linux-foundation.org,
 Andreas Noever <andreas.noever@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Linux PCI <linux-pci@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
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

On Thu, Sep 30, 2021 at 11:25 AM Yehezkel Bernat <yehezkelshb@gmail.com> wrote:
>
> On Thu, Sep 30, 2021 at 6:28 PM Dan Williams <dan.j.williams@intel.com> wrote:
> >
> > On Thu, Sep 30, 2021 at 4:20 AM Yehezkel Bernat <yehezkelshb@gmail.com> wrote:
> > >
> > > On Thu, Sep 30, 2021 at 4:05 AM Kuppuswamy Sathyanarayanan
> > > <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> > > >
> > > > no functional
> > > > changes other than value 2 being not visible to the user.
> > > >
> > >
> > > Are we sure we don't break any user-facing tool with it? Tools might use this to
> > > "remember" how the device was authorized this time.
> >
> > That's why it was highlighted in the changelog. Hopefully a
> > Thunderbolt developer can confirm if it is a non-issue.
> > Documentation/ABI/testing/sysfs-bus-thunderbolt does not seem to
> > answer this question about whether authorized_show and
> > authorized_store need to be symmetric.
>
> Apparently, Bolt does read it [1] and cares about it [2].

Ah, thank you!

Yeah, looks like the conversion to bool was indeed too hopeful.

>
> [1] https://gitlab.freedesktop.org/bolt/bolt/-/blob/130e09d1c7ff02c09e4ad1c9c36e9940b68e58d8/boltd/bolt-sysfs.c#L511
> [2] https://gitlab.freedesktop.org/bolt/bolt/-/blob/130e09d1c7ff02c09e4ad1c9c36e9940b68e58d8/boltd/bolt-device.c#L639
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
