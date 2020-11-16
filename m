Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B762B4A8E
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 17:17:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A3D387183;
	Mon, 16 Nov 2020 16:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y+2nV8Zoyice; Mon, 16 Nov 2020 16:17:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 19A478717A;
	Mon, 16 Nov 2020 16:17:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1438C07FF;
	Mon, 16 Nov 2020 16:17:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D19BEC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CD16987168
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvRS0vohKrnl
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:17:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6C09887182
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:17:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAB9022314
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605543465;
 bh=Mv6f7f8506FraoMumz35j4BQyYx1tMmBjlS7DZTMh6s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cO0fEGISnNA7PcgOiATiolTw7tAkS5Zg7T/iuml160lD72+D/c5QQCC6g99NPdiv0
 E+tm/P0YcyWfeksg5V68oPeJbMzzoFz8MOlckQYOvSLN5cL4nnxznKQsmlZxwvR3+9
 21xAGXQROAjxwTtWdTl8e7cPOi/ciZNc1Yiis33Q=
Received: by mail-wm1-f51.google.com with SMTP id s13so24108906wmh.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 08:17:44 -0800 (PST)
X-Gm-Message-State: AOAM532oJnrwJpMBzmEWA26E1LCProUsIcLRSz7Mj2oC7fnTXy4tQXXU
 1eckRKduatpvw3VyxvOVGSeHk3z6tBs5ci2bv3JNLw==
X-Google-Smtp-Source: ABdhPJzo4DLkbb/iKsJTRaDIKTsVLyxyBBgQcLU+k85si7bdNAKlaxr9HCjPF0P3RxTG5pvYnF7uVMxefE2gleeWFnw=
X-Received: by 2002:a1c:7213:: with SMTP id n19mr15820304wmc.36.1605543463407; 
 Mon, 16 Nov 2020 08:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20201116152301.24558-1-jgross@suse.com>
 <20201116152301.24558-4-jgross@suse.com>
In-Reply-To: <20201116152301.24558-4-jgross@suse.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 16 Nov 2020 08:17:29 -0800
X-Gmail-Original-Message-ID: <CALCETrWwnK1AwrGRn8Kuin-23NOG31LrWBO7w=T2QE+EJW=f-w@mail.gmail.com>
Message-ID: <CALCETrWwnK1AwrGRn8Kuin-23NOG31LrWBO7w=T2QE+EJW=f-w@mail.gmail.com>
Subject: Re: [PATCH 3/4] x86/pv: switch SWAPGS to ALTERNATIVE
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

On Mon, Nov 16, 2020 at 7:23 AM Juergen Gross <jgross@suse.com> wrote:
>
> SWAPGS is used only for interrupts coming from user mode or for
> returning to user mode. So there is no reason to use the PARAVIRT
> framework, as it can easily be replaced by an ALTERNATIVE depending
> on X86_FEATURE_XENPV.
>
> There are several instances using the PV-aware SWAPGS macro in paths
> which are never executed in a Xen PV guest. Replace those with the
> plain swapgs instruction. For SWAPGS_UNSAFE_STACK the same applies.

Acked-by: Andy Lutomirski <luto@kernel.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
