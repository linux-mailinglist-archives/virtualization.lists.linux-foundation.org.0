Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F33F1ED32D
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 17:19:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E909F877E8;
	Wed,  3 Jun 2020 15:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvjVXi7nyc2X; Wed,  3 Jun 2020 15:19:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F200D879FD;
	Wed,  3 Jun 2020 15:19:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C870FC016E;
	Wed,  3 Jun 2020 15:19:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07A49C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 15:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E3F0C877E8
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 15:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kautpPGKTq8T
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 15:19:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 97C92878D6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 15:19:01 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4B99F28B; Wed,  3 Jun 2020 17:18:58 +0200 (CEST)
Date: Wed, 3 Jun 2020 17:18:57 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 35/75] x86/head/64: Build k/head64.c with
 -fno-stack-protector
Message-ID: <20200603151857.GC23071@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-36-joro@8bytes.org>
 <CAMzpN2gfiBAeCV_1+9ogh42bMMuDW=qdwd7dYp49-=zY3kzBaA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMzpN2gfiBAeCV_1+9ogh42bMMuDW=qdwd7dYp49-=zY3kzBaA@mail.gmail.com>
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

On Tue, May 19, 2020 at 09:58:18AM -0400, Brian Gerst wrote:
> On Tue, Apr 28, 2020 at 11:28 AM Joerg Roedel <joro@8bytes.org> wrote:

> The proper fix would be to initialize MSR_GS_BASE earlier.

That'll mean to initialize it two times during boot, as the first C
function with stack-protection is called before the kernel switches to
its high addresses (early_idt_setup call-path). But okay, I can do that.

On the other side, which value does the stack protector have in the early
boot code?


	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
