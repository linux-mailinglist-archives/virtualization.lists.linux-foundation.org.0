Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B5A18392B
	for <lists.virtualization@lfdr.de>; Thu, 12 Mar 2020 20:05:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE03988393;
	Thu, 12 Mar 2020 19:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3AaqcpixVjb; Thu, 12 Mar 2020 19:05:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 80A65883CA;
	Thu, 12 Mar 2020 19:05:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D5A6C0177;
	Thu, 12 Mar 2020 19:05:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7A6EC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 19:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A0CB886CB5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 19:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-w8a8XZekGh
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 19:05:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4736286C82
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 19:05:25 +0000 (UTC)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jCT8t-00008p-6x; Thu, 12 Mar 2020 20:05:15 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 8B3D810120C; Thu, 12 Mar 2020 20:05:14 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Alexey Makhalov <amakhalov@vmware.com>, x86@kernel.org
Subject: Re: [PATCH 0/5] x86/vmware: Steal time accounting support
In-Reply-To: <20200212200312.2033-1-amakhalov@vmware.com>
References: <20200212200312.2033-1-amakhalov@vmware.com>
Date: Thu, 12 Mar 2020 20:05:14 +0100
Message-ID: <87blp1iec5.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
Cc: Juergen Gross <jgross@suse.com>, Alexey Makhalov <amakhalov@vmware.com>,
 Jonathan Corbet <corbet@lwn.net>, "VMware, Inc." <pv-drivers@vmware.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
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

Alexey Makhalov <amakhalov@vmware.com> writes:
>
> Alexey Makhalov (5):
>   x86/vmware: Make vmware_select_hypercall() __init
>   x86/vmware: Remove vmware_sched_clock_setup()
>   x86/vmware: Steal time clock for VMware guest
>   x86/vmware: Enable steal time accounting
>   x86/vmware: Use bool type for vmw_sched_clock

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
