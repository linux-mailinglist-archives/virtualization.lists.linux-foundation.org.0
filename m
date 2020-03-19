Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBA18BB66
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 16:44:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58FBA87E6E;
	Thu, 19 Mar 2020 15:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAkNEhLVWGnG; Thu, 19 Mar 2020 15:44:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ADF0A87E74;
	Thu, 19 Mar 2020 15:44:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 734A0C07FF;
	Thu, 19 Mar 2020 15:44:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73457C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 61FD086C48
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ahkx3uZLKX2H
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:44:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ED02686C47
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:44:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82DE9208D6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 15:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584632656;
 bh=FVF/u9TSzlMdhf4kpAsywZwLbl/sGhd8ENC//u14qkk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I0y8sUtct/Bh3UhCYALlKYXq+6n0HLrW6vax7RdHHsEFi5n3GSL+JQMq0m0DjnndW
 Xnlr5ugUwiw8Ty8NfSG7okzMxvecohY1DohE1VEjUTEVJLbVTbJhrexGrjUrcjgFHl
 WDAK45zaZZs97psWeLFp4eLJq6uLqm/BJjrLdIjE=
Received: by mail-wr1-f48.google.com with SMTP id s1so3640579wrv.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 08:44:16 -0700 (PDT)
X-Gm-Message-State: ANhLgQ05Iky2CihiZRBfzAZUFuBY2MudH9iAoypGF7mnJ2RjVN12cpsy
 VmO5VGo2ZxpV9Ydm3pINv1qjryyAI/zo0SUhOipYpw==
X-Google-Smtp-Source: ADFU+vu9xO32MybzBmacdPgCqlG7WVDPKTtdn223Fbu4PAIymbvyrGwQMSSWxAV7RNpXhGgQhHa1JuyvGJ5sDsUdXMI=
X-Received: by 2002:adf:a30b:: with SMTP id c11mr4940938wrb.257.1584632654996; 
 Thu, 19 Mar 2020 08:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-42-joro@8bytes.org>
In-Reply-To: <20200319091407.1481-42-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 19 Mar 2020 08:44:03 -0700
X-Gmail-Original-Message-ID: <CALCETrW9EYi5dzCKNtKkxM18CC4n5BZxTp1=qQ5qZccwstXjzg@mail.gmail.com>
Message-ID: <CALCETrW9EYi5dzCKNtKkxM18CC4n5BZxTp1=qQ5qZccwstXjzg@mail.gmail.com>
Subject: Re: [PATCH 41/70] x86/sev-es: Add Runtime #VC Exception Handler
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

On Thu, Mar 19, 2020 at 2:14 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Tom Lendacky <thomas.lendacky@amd.com>
>
> Add the handler for #VC exceptions invoked at runtime.

If I read this correctly, this does not use IST.  If that's true, I
don't see how this can possibly work.  There at least two nasty cases
that come to mind:

1. SYSCALL followed by NMI.  The NMI IRET hack gets to #VC and we
explode.  This is fixable by getting rid of the NMI EFLAGS.TF hack.

2. tools/testing/selftests/x86/mov_ss_trap_64.  User code does MOV
(addr), SS; SYSCALL, where addr has a data breakpoint.  We get #DB
promoted to #VC with no stack.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
