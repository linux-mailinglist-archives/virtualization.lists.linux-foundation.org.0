Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C1841DD73
	for <lists.virtualization@lfdr.de>; Thu, 30 Sep 2021 17:28:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AC774259E;
	Thu, 30 Sep 2021 15:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0PjJpfBn9_Qf; Thu, 30 Sep 2021 15:28:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DE33D422B6;
	Thu, 30 Sep 2021 15:28:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76EFFC000D;
	Thu, 30 Sep 2021 15:28:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43A53C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 15:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29BB940358
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 15:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_8u8KQiY_iC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 15:28:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EB4040346
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 15:28:46 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id k23so4488009pji.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jx2U1fXVMAX8YVJnygiZPmNCKOQJD2Hj7BS/kMAYEgs=;
 b=agBAaxvELaCg38+3MxkDJ5W3WTSUor6hjrK6UKjt7TpCZZuOPc7FM6IKQBxSyoc52K
 ilxpSY9wGu5Gckh+Y8wN93EqxSZzaoJx/7UfSc/o94BA/avp/+GptpxHQJdaTadAAjUO
 dApT93yF6zsQdX+lxSSJHyhabVLKYswM5ji7mIpRt06U+F8zgITyyWPHLuyJeCwWWRGN
 Y15ffW0I+FZnbmTTtme+SdoYeyiWGTduhyGuvTThXHcvhLrxiSGC2HEm/q23MDFOHhgq
 oCJmcf19GZOambHRb3p397D+7b6T+d8k74DqQhG9jcverKvnrcGX3TISXhAdq6YTGeUa
 BG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jx2U1fXVMAX8YVJnygiZPmNCKOQJD2Hj7BS/kMAYEgs=;
 b=Be+qFW1j4IwjqYm/HUMXOpzViScf65erBXOsKRNqoAqUf2FxIlat4JhQiF6pmZqJTv
 qJUEL4AlDFgdz240aU7uP7hBs4RGq/PAeIX7cEFlcz6RaxzNT1708Ss2VbKiYbjFOyE/
 LXanhBJtVLFpIx+M6csK0I8tS7FyMdPaViJ0/u2ZW1XAL3HKShsGzz7qDqv+398YbfLH
 zoS9Qkko0jj8GiFnShPr+HbzK+8vWS6DFh7y7Sk5Y2pVR+uir9sLmupT0OaCy8AnJtRy
 9FD/JPct8ToUuPVyQ8wcljdteC5CNsX4CHCYu1QOcxOjdTkdf5mhpqlSfHFrPEr2K+QO
 ljKQ==
X-Gm-Message-State: AOAM532Js9SVCQkKQy2YCsLaiStPlaVAQ6bFD+HgJl5AxStBx94Utz4j
 3Z+avQxTxTPJF6vyyCkh2mR9pWSwOUrCFgu4B/c0AQ==
X-Google-Smtp-Source: ABdhPJy+Q5gdj1FvBjL6jYwPI7vYzDx17vSL3eDwmyx/hbSgqCzUcrj89W/AlsE7w1znCFVh/khI/9h4dUStCMaYHDk=
X-Received: by 2002:a17:90a:d686:: with SMTP id
 x6mr13753493pju.8.1633015726357; 
 Thu, 30 Sep 2021 08:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-2-sathyanarayanan.kuppuswamy@linux.intel.com>
 <CA+CmpXtXn5wjxwow5va5u9qHcQDLkd4Sh2dcqB545SXaxV1GkQ@mail.gmail.com>
In-Reply-To: <CA+CmpXtXn5wjxwow5va5u9qHcQDLkd4Sh2dcqB545SXaxV1GkQ@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 30 Sep 2021 08:28:36 -0700
Message-ID: <CAPcyv4iNp41mZcpzGCPR9Xty83j+abk_SOxvsx1xaQ8wALRv0Q@mail.gmail.com>
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

On Thu, Sep 30, 2021 at 4:20 AM Yehezkel Bernat <yehezkelshb@gmail.com> wrote:
>
> On Thu, Sep 30, 2021 at 4:05 AM Kuppuswamy Sathyanarayanan
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> >
> > no functional
> > changes other than value 2 being not visible to the user.
> >
>
> Are we sure we don't break any user-facing tool with it? Tools might use this to
> "remember" how the device was authorized this time.

That's why it was highlighted in the changelog. Hopefully a
Thunderbolt developer can confirm if it is a non-issue.
Documentation/ABI/testing/sysfs-bus-thunderbolt does not seem to
answer this question about whether authorized_show and
authorized_store need to be symmetric.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
