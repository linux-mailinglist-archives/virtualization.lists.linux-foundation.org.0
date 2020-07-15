Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E112208A3
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 11:25:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 73DBD88F77;
	Wed, 15 Jul 2020 09:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYR8DN_2zl7G; Wed, 15 Jul 2020 09:25:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D9DC9890F6;
	Wed, 15 Jul 2020 09:25:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8B36C0733;
	Wed, 15 Jul 2020 09:25:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7F6CC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 88B8620512
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6g9zOZLxBN9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:25:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id 7020E20478
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dK8UwzUTgUNLePBN/9TrjpAB3tyGtmDfMqWT0SbBnEY=; b=SYThOw0DKQ59j+xOZ9e7s9giuM
 tDfpXRj67AxyxcDD/DruSpiV3lLLocgumIGHcor3cLJvMbB67U/P86WHzwLBDWnMM7/VE7d5DilUf
 4YM2HlWFCuP5zJIWETM4zuvR53OwsBKsLKMox2dndow+qB3qgoNDTu5XP018d/PmLoVEQc1+4SV8H
 EWEbQpfJpVa6/+Ui67qnx6GgCoPLKU0raNxCb0U6Ww2OCVdoVtagwaYzi4qgDr5u/1i9S5Ss2tK9y
 XIbatbd4Y1yNWkVo40PSHRKeEh/tlULCWSefU7V9Uf0In+2TOyvTgUB9j1R0/FONOEmAyGtW0Sf5P
 TNZ6ff8Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvdeu-0001jJ-Bk; Wed, 15 Jul 2020 09:25:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4FE7C305B23;
 Wed, 15 Jul 2020 11:24:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 438C6207A6655; Wed, 15 Jul 2020 11:24:56 +0200 (CEST)
Date: Wed, 15 Jul 2020 11:24:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 00/75] x86: SEV-ES Guest Support
Message-ID: <20200715092456.GE10769@hirez.programming.kicks-ass.net>
References: <20200714120917.11253-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714120917.11253-1-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Cfir Cohen <cfir@google.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Tue, Jul 14, 2020 at 02:08:02PM +0200, Joerg Roedel wrote:
> The #VC entry code now tries to pretend that the #VC handler does not
> use an IST stack by switching to the task stack if entered from
> user-mode or the SYSCALL entry path. When it is entered from
> kernel-mode it is doing its best to switch back to the interrupted
> stack. This is only possible if it is entered from a known and safe
> kernel stack (e.g. not the entry stack). If the previous stack is not
> safe to use the #VC handler switches to a fall-back stack and calls a
> special handler function which, as of now, just panics the system. For
> now this is safe as #VC exceptions only happen at know places which
> use a safe stack.
> 
> The use of the fall-back stack is necessary so that the special
> handler function can safely raise nested #VC exceptions, for
> example to print a panic message.

Can we get some more words -- preferably in actual code comments, on
when exactly #VC happens?

Because the only thing I remember is that #VC could happen on any memop,
but I also have vague memories of that being a later extention.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
