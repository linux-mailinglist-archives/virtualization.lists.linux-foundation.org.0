Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9370C18BC09
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 17:12:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 42D5188411;
	Thu, 19 Mar 2020 16:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LwS1eo+RshdE; Thu, 19 Mar 2020 16:12:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6D24D88415;
	Thu, 19 Mar 2020 16:12:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E18DC1D89;
	Thu, 19 Mar 2020 16:12:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA180C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9068B883F5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFrdoNf7wYVv
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:12:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7BE0B883E6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:12:49 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 885FC217; Thu, 19 Mar 2020 17:12:47 +0100 (CET)
Date: Thu, 19 Mar 2020 17:12:46 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 42/70] x86/sev-es: Support nested #VC exceptions
Message-ID: <20200319161245.GD5122@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-43-joro@8bytes.org>
 <CALCETrXiWjALMTcG=92DmMn_H=yR88e0-3cj8CjTAjtjTvBR8w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrXiWjALMTcG=92DmMn_H=yR88e0-3cj8CjTAjtjTvBR8w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, "H. Peter Anvin" <hpa@zytor.com>,
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

On Thu, Mar 19, 2020 at 08:46:36AM -0700, Andy Lutomirski wrote:
> This can't possibly end well.  Maybe have a little percpu list of
> GHCBs and make sure there are enough for any possible nesting?

Yeah, it is not entirely robust yet. Without NMI nesting the number of
possible #VC nesting levels should be limited. At least one backup GHCB
pre-allocated is probably a good idea.

> Also, I admit confusion.  Isn't the GHCB required to be unencrypted?
> How does that work with kzalloc()?

Yes, but the kzalloc'ed ghcb is just the backup space for the real GHCB,
which is mapped unencrypted. The contents of the unencrypted GHCB is
copied to the backup and restored on return, so that the interrupted #VC
handler finds the GHCB unmodified.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
