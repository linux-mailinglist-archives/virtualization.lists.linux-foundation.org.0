Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 152652D4C76
	for <lists.virtualization@lfdr.de>; Wed,  9 Dec 2020 22:07:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 238C386C4D;
	Wed,  9 Dec 2020 21:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeouHpymPzu8; Wed,  9 Dec 2020 21:07:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C38986C74;
	Wed,  9 Dec 2020 21:07:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08900C0FA7;
	Wed,  9 Dec 2020 21:07:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E2EFC013B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 21:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 46C422047F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 21:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8tRI3JnCMav
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 21:07:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id 5D73D204C6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 21:07:16 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607548032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L7i3CPNAPt2KU+IZb9dhE7iSR6cyuRM8HyieTAr/YYg=;
 b=kq1OHmCQNTXmjFxRiiYQCtMcgHsW2nl9XwXEhd2UDC34JY4VqsuqNqWdgTS3YK0B2HTN0a
 GLiGRqcl4feIgRGti60S5LHayQAwiZFaJ2AcyKwnEyQbepXQ2jz8X8vNbxqDaot95wevaf
 Lz67AUgT8+6fwzbCvE7SbExB3ThHr/fHr+UAilkliO85KAQIMK7eww5bH7SAetpnob4Kqc
 q6ySWnueDo4tqYCw7qzFmoI9zbcSv58CxsWPgdnODOP/uZ4j59J5/wPRhcDpcZpcic0r+V
 wcfFMs/wLf2fAEfHBp8cin02bVRhQTrk424mMLHkmAmUY5hzxKqvWbPQgnwCnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607548032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L7i3CPNAPt2KU+IZb9dhE7iSR6cyuRM8HyieTAr/YYg=;
 b=htO3ZaH9N+kRa526lyS/ICS9mPFUq9txIKXd3dIhl9PtBy0srICRWtTNhIRq5W11XlRqAu
 yEM17S/seRxu7uBg==
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 03/12] x86/pv: switch SWAPGS to ALTERNATIVE
In-Reply-To: <20201120114630.13552-4-jgross@suse.com>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-4-jgross@suse.com>
Date: Wed, 09 Dec 2020 22:07:12 +0100
Message-ID: <871rfylmdb.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, peterz@infradead.org, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

On Fri, Nov 20 2020 at 12:46, Juergen Gross wrote:
> SWAPGS is used only for interrupts coming from user mode or for
> returning to user mode. So there is no reason to use the PARAVIRT
> framework, as it can easily be replaced by an ALTERNATIVE depending
> on X86_FEATURE_XENPV.
>
> There are several instances using the PV-aware SWAPGS macro in paths
> which are never executed in a Xen PV guest. Replace those with the
> plain swapgs instruction. For SWAPGS_UNSAFE_STACK the same applies.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Andy Lutomirski <luto@kernel.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
