Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD5159C2E
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:28:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4126620526;
	Tue, 11 Feb 2020 22:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LwEcfNWgIvRQ; Tue, 11 Feb 2020 22:28:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3D9B220524;
	Tue, 11 Feb 2020 22:28:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 212E6C07FE;
	Tue, 11 Feb 2020 22:28:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01EFDC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DF75785533
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TfJkUj98FVLX
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:28:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7C57184D11
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:28:19 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10A4D217F4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581460099;
 bh=qr3w/Jk4E7ZCigNfuSnbve2ZaYJ6PJplvO36QBtgk3A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NbhIRNqjUWMveUgY7a+SRNavuBLMaEJ0S2oXpbC09sQj8F1OxfAaPXKrzuWU3TF2O
 Mw+vNvdw9fNIzYXnERaAnsTNo8ZHS1QCAPy5Nvu8ouh1ktsRBH8DIULlWinJRU+cW+
 hVMAIhu2xjN3VS9wPKN+Ai4P976oR8rTNBaTMTcQ=
Received: by mail-wr1-f52.google.com with SMTP id z3so14576821wru.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:28:18 -0800 (PST)
X-Gm-Message-State: APjAAAVmW/hFCOBpTH/mXPL81ciy7uR0WZoV68ukLECXf8ZvvX61y7l3
 MuqUnyIpS87NzxqQFtS2w+/TszGkQQ846kMWtC9uzg==
X-Google-Smtp-Source: APXvYqxuwxNAwq4kzXKENcWaHlU1Oo2EBlzHy1k0fYPvxMGCQYfMlvTgvb3+mfAmlPcL+PPn6IOa2/0gfWBtQFH5zR0=
X-Received: by 2002:adf:a354:: with SMTP id d20mr10781683wrb.257.1581460097315; 
 Tue, 11 Feb 2020 14:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-20-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-20-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:28:06 -0800
X-Gmail-Original-Message-ID: <CALCETrWecBK7cqgLTB72mMYRs10R1e+rkZh9mnzRNJc0N=XU2Q@mail.gmail.com>
Message-ID: <CALCETrWecBK7cqgLTB72mMYRs10R1e+rkZh9mnzRNJc0N=XU2Q@mail.gmail.com>
Subject: Re: [PATCH 19/62] x86/sev-es: Add support for handling IOIO exceptions
To: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

On Tue, Feb 11, 2020 at 5:53 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Tom Lendacky <thomas.lendacky@amd.com>
>
> Add support for decoding and handling #VC exceptions for IOIO events.
>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> [ jroedel@suse.de: Adapted code to #VC handling framework ]
> Co-developed-by: Joerg Roedel <jroedel@suse.de>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

It would be nice if this could reuse the existing in-kernel
instruction decoder.  Is there some reason it can't?

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
