Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B4818D882
	for <lists.virtualization@lfdr.de>; Fri, 20 Mar 2020 20:43:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A70C48706A;
	Fri, 20 Mar 2020 19:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9GU9qcMzbBL; Fri, 20 Mar 2020 19:43:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8FCEE86E50;
	Fri, 20 Mar 2020 19:43:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69063C07FF;
	Fri, 20 Mar 2020 19:43:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA2B6C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 19:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B505B86B23
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 19:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVIiecmLOpCs
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 19:43:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A4C5986AB7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 19:43:02 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CD3DA4CA; Fri, 20 Mar 2020 20:42:56 +0100 (CET)
Date: Fri, 20 Mar 2020 20:42:52 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [RFC PATCH v2.1] x86/sev-es: Handle NMI State
Message-ID: <20200320194251.GI5122@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-71-joro@8bytes.org>
 <CALCETrUOQneBHjoZkP-7T5PDijb=WOyv7xF7TD0GLR2Aw77vyA@mail.gmail.com>
 <20200320131707.GF5122@8bytes.org>
 <7d1ee9d9-d333-4529-b21b-19758c99e029@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d1ee9d9-d333-4529-b21b-19758c99e029@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Fri, Mar 20, 2020 at 07:42:09AM -0700, Dave Hansen wrote:
> FWIW, perf plus the x86 selftests run in a big loop was my best way of
> stressing the NMI path when we mucked with it for PTI.  The selftests
> make sure to hit some of the more rare entry/exit paths.

Yeah, I ran the x86 selftests in an SEV-ES guest on-top of these
patches, that works. But doing this together with 'perf top' is also on
the list of tests to do.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
