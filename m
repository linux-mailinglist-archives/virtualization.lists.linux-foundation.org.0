Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FA52BB8CB
	for <lists.virtualization@lfdr.de>; Fri, 20 Nov 2020 23:21:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3186386C77;
	Fri, 20 Nov 2020 22:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PI6xSOQzuBP0; Fri, 20 Nov 2020 22:21:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB9FA86D2F;
	Fri, 20 Nov 2020 22:21:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAF82C1D9F;
	Fri, 20 Nov 2020 22:21:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38201C0891;
 Fri, 20 Nov 2020 22:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 24E7587526;
 Fri, 20 Nov 2020 22:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rcWu9Oe5X40r; Fri, 20 Nov 2020 22:21:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 679BF8751F;
 Fri, 20 Nov 2020 22:21:29 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id s8so9934938yba.13;
 Fri, 20 Nov 2020 14:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=29/AaAKKWIjlxKBDiu42mXe16/c3LUzQvTdn0Wctw9g=;
 b=th/UjqVcversiy9gEUr46cKRrhHywr0iTgf9mzUejm+T3/Jtu2c6ftjob7N1dnOe2S
 rGVMit/4Gqy7ZDqW+do8x9wI8RCPt/cmuWncILsoBuux3CBAtfG8gT+eTL8wiBVSM5EH
 rDgxqkIvK+vUXnfhgj71GxYIUQH1hInVNMbCl5+3prik9RGhi+hsmul85xXuf9uJVr2L
 NGLQGWDmOXXHg4l9XujW0HrVyacbE3Q1QSLAkLJ0BjE5AdFqhLyeU3T8/6+nJ9hH0JSR
 o1vAVeqr6Bt+/W6rGIwrn7PuvAvMGRmk1Avx4k6vjCg8etglRiDTMnimrqKcX/KEsNCP
 0CAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29/AaAKKWIjlxKBDiu42mXe16/c3LUzQvTdn0Wctw9g=;
 b=fZdSgy/0aYgwhs0+ZYQBtXRsp993mEFmUuhvA0uW03UVoshd5ngwbaf2dHKr1nd9Bj
 uRX41e4Ze0zhcN8okdHGlNDk3rotauftgnKHASG9/IHIJr9nRf8Am9ZvJIqi0gFQHgt4
 XsRJ/eDeH3c1zJqhO8D8hDXSNfohi4J116hDZpE6Wu6RFiITYfwAc9af6aMrdL3FZeGw
 sGSnjHYwVIxKcerMevotdrdfJAB+/D5hlURoeTQeudBQJj37gsl2oyPYDdXEszVFeDfO
 n2wyaKmrS7oQzwolxn0gXay6OG0AM0imrmHiEiGNa+c5ZTD1IvKE+gFObma949DyMT3W
 1wkw==
X-Gm-Message-State: AOAM530+0RbWoBhaYa4kJlPj6ygJ2c4fWtqNx8ok43naKOYdEXDNDKeW
 lapx3l5M0eKIF7te4bagxLvUirIhoFs0wIlBHjw=
X-Google-Smtp-Source: ABdhPJzYUhkcjTyH5GIcOV5fWMsl+OUdzem471zLY9usW3RhV8izQIRbyESMTmZwFikqgbfOQQqVvSSQCZzBPJX4q90=
X-Received: by 2002:a5b:40e:: with SMTP id m14mr22113400ybp.33.1605910888617; 
 Fri, 20 Nov 2020 14:21:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2020 23:21:17 +0100
Message-ID: <CANiq72=E_gEVvqUUTSqU4zegC2=yZSTM4b=4G-iofp6d3=UgWQ@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
 Kees Cook <keescook@chromium.org>, Linux-MM <linux-mm@kvack.org>,
 Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
 netfilter-devel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

Hi Gustavo,

On Fri, Nov 20, 2020 at 7:21 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Hi all,
>
> This series aims to fix almost all remaining fall-through warnings in
> order to enable -Wimplicit-fallthrough for Clang.

Thanks for this.

Since this warning is reliable in both/all compilers and we are
eventually getting rid of all the cases, what about going even further
and making it an error right after?

Cheers,
Miguel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
