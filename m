Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BC422A97E
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 09:21:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 13A3C878CC;
	Thu, 23 Jul 2020 07:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeHH9RLzuKQG; Thu, 23 Jul 2020 07:21:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ECBDC878C9;
	Thu, 23 Jul 2020 07:21:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAF72C004C;
	Thu, 23 Jul 2020 07:21:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23B88C004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 07:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 13ADF26C87
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 07:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgBurY96BIMu
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 07:21:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 0D73526C45
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 07:21:07 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E2EE4346; Thu, 23 Jul 2020 09:21:03 +0200 (CEST)
Date: Thu, 23 Jul 2020 09:21:02 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Mike Stunes <mstunes@vmware.com>
Subject: Re: [PATCH v4 51/75] x86/sev-es: Handle MMIO events
Message-ID: <20200723072102.GN27672@8bytes.org>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-52-joro@8bytes.org>
 <40D5C698-1ED2-4CCE-9C1D-07620A021A6A@vmware.com>
 <20200722080530.GH6132@suse.de>
 <7020C1D2-5900-4AD8-ADCD-04A571DF2EA7@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7020C1D2-5900-4AD8-ADCD-04A571DF2EA7@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Jiri Slaby <jslaby@suse.cz>
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

Hi Mike,

On Wed, Jul 22, 2020 at 10:53:02PM +0000, Mike Stunes wrote:
> Thanks Joerg! With that change in place, this kernel boots normally.
> What was the problem?

The problem was that the code got its page-table from
current->active_mm. But these pointers are not set up during early boot,
so that the #VC handler can't walk the page-table and propagates a
page-fault every time. This loops forever.

Getting the page-table from CR3 instead works at all stages of the
systems runtime.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
