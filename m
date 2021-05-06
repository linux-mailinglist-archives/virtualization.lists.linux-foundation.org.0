Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E980375A25
	for <lists.virtualization@lfdr.de>; Thu,  6 May 2021 20:24:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCCD960732;
	Thu,  6 May 2021 18:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04CHfdChcWjv; Thu,  6 May 2021 18:24:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAB75606A5;
	Thu,  6 May 2021 18:24:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 468C1C0001;
	Thu,  6 May 2021 18:24:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49C07C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A79860732
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1Tz-eokdH_F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:24:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 734A4606A5
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 May 2021 18:24:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26F63AF98;
 Thu,  6 May 2021 18:24:04 +0000 (UTC)
Date: Thu, 6 May 2021 20:24:01 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 1/2] kexec: Allow architecture code to opt-out at runtime
Message-ID: <YJQ0QdjdRwpMkIqU@suse.de>
References: <20210506093122.28607-1-joro@8bytes.org>
 <20210506093122.28607-2-joro@8bytes.org>
 <YJQOmxx1EMUqNpNn@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJQOmxx1EMUqNpNn@google.com>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Kees Cook <keescook@chromium.org>,
 Cfir Cohen <cfir@google.com>, linux-coco@lists.linux.dev,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Erdem Aktas <erdemaktas@google.com>
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

On Thu, May 06, 2021 at 03:43:23PM +0000, Sean Christopherson wrote:
> This misses kexec_file_load.

Right, thanks, I will fix that in the next version.

> Also, is a new hook really needed?  E.g. the SEV-ES check be shoved
> into machine_kexec_prepare().  The downside is that we'd do a fair
> amount of work before detecting failure, but that doesn't seem hugely
> problematic.

That could work, but I think its more user-friendly to just claim that
the syscalls are not supported at all.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
