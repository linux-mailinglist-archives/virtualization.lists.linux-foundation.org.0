Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C61461ED4C6
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 19:14:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 57B8486C51;
	Wed,  3 Jun 2020 17:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJpJyXaheXUn; Wed,  3 Jun 2020 17:14:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CA88D86C40;
	Wed,  3 Jun 2020 17:14:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7313C016E;
	Wed,  3 Jun 2020 17:14:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21E4FC016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 17:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0888D87875
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 17:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y72n6yP0VNnq
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 17:14:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 77E8287899
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 17:14:23 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id s18so3148988ioe.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 03 Jun 2020 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L1fN4KADaSCEVr+fi2VR4+YYdyW02dzdqKarwAuE5JM=;
 b=Db0LhHXVPJ1WDh4jiINB0XFaVbDBzWenltsB/4/hA7fJZ6Hr8v0Xht83c3199T1yxi
 wj6zyxjnOytfhPMMJoqYDdWPXy13gaAApB9OAijKtHKZiI2X6rX0gFcT05L+2PIc7wEg
 sAuGgs0Oi2thTotzd7Kz3DVQyVc8wOdDv9YLmxxRVFSbxdfo00cEj51yRXyPEQgVNuyt
 iyg2XZsVkEYuK83zco2OpPkPFOjgxshuaW61s4O6ttmYKWrMzjenifBmbDHToXgSUmod
 ZOa0ddWhfLP1JZosxFIKMvhxA97FHlf/ANjJkOFh5wPRfryMd9a0NPvJSIsP4dsX+tUB
 NhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1fN4KADaSCEVr+fi2VR4+YYdyW02dzdqKarwAuE5JM=;
 b=rKMHUziBAkE0o6qHvIe9rbcRhm4+Z1zOFFZUPrAYxx7QE/sj3g4jDuuiHwPBHHGYCw
 AvW5NSyWK9eCNZqmQu0wxeZbgCwQYAE71pPwzfZFHr8kZFD7eoQ/igiAEGHka/p7dXbZ
 HnEyoqH0JGjZnm5CGqiWgf/3Sp1TUwXMYBwkVjMNgjNn2H7xkY+MgUxu+L/SHzFO34KK
 cxOlCenWPi0hC9Hdyeyu7HaIjS4EYnJ2MX53RVGaolduLAav38EBDt8swMp0nJHq7HFV
 ggCKRDrXwDnSOq3vahyhx181toba523SjR7R5/xrwEgetgjCFy4tnTNAGoUGiVBcgGQU
 dJXw==
X-Gm-Message-State: AOAM531ERJT3tBTiVre8rKXioen+ibLoK3oLTGZqmByRImbxDvyOcB+a
 OuA03ASvyaqeSTbcBDeYz5jChVATxzUNVq+YFQ==
X-Google-Smtp-Source: ABdhPJwjZZNidpPXbWcqeOMttWh4MrMd0WNuRBvM2NVR4bh1JG/Y8s7Xe8ro/oDnN+4cwCNlt5lqXFhGvn0iRNhKMj8=
X-Received: by 2002:a6b:fc0d:: with SMTP id r13mr715961ioh.40.1591204462837;
 Wed, 03 Jun 2020 10:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-36-joro@8bytes.org>
 <CAMzpN2gfiBAeCV_1+9ogh42bMMuDW=qdwd7dYp49-=zY3kzBaA@mail.gmail.com>
 <20200603151857.GC23071@8bytes.org>
In-Reply-To: <20200603151857.GC23071@8bytes.org>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 3 Jun 2020 13:14:11 -0400
Message-ID: <CAMzpN2j4t7UwOFwSR8gVo-FpAQ_RS5pE1c8JZns3xyUXP3yANQ@mail.gmail.com>
Subject: Re: [PATCH v3 35/75] x86/head/64: Build k/head64.c with
 -fno-stack-protector
To: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm list <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Erdem Aktas <erdemaktas@google.com>, David Rientjes <rientjes@google.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>
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

On Wed, Jun 3, 2020 at 11:18 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Tue, May 19, 2020 at 09:58:18AM -0400, Brian Gerst wrote:
> > On Tue, Apr 28, 2020 at 11:28 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> > The proper fix would be to initialize MSR_GS_BASE earlier.
>
> That'll mean to initialize it two times during boot, as the first C
> function with stack-protection is called before the kernel switches to
> its high addresses (early_idt_setup call-path). But okay, I can do that.

Good point.  Since this is boot code which isn't subject to stack
smashing attacks, disabling stack protector is probably the simpler
option.

--
Brian Gerst
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
