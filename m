Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 394F138C964
	for <lists.virtualization@lfdr.de>; Fri, 21 May 2021 16:44:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89D8740143;
	Fri, 21 May 2021 14:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9lLAHSnKNMY; Fri, 21 May 2021 14:44:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 450CC4022C;
	Fri, 21 May 2021 14:44:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB02DC0001;
	Fri, 21 May 2021 14:44:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0096C0001
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 14:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6D6D83774
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 14:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=alien8.de
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqF0t6AjxLK0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 14:44:30 +0000 (UTC)
X-Greylist: delayed 00:09:46 by SQLgrey-1.8.0
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8151182BC3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 May 2021 14:44:30 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0ea400b1711cbbd717391b.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:a400:b171:1cbb:d717:391b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 394031EC061D;
 Fri, 21 May 2021 16:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1621607681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=+eiP6mVRfierNZHVHWE39OmfVBD4FccBazbJrnrFRg0=;
 b=ROd1grQ3afwj6jw9TXiBn8Gd9qql4j0xLcF+A4Lqj4zbmGPwP2BmwMNSG9cy7VgQRH6Y1i
 q7L03gy8DOnoLw9UiHZ6w+3+1IRtJ3DdPWKaZRMMCu9EkiRcmi3F0YGbVRbTLJm25OqlWG
 Wz3z6tI68a+fpsHb7fn5HUCNVbQJv6Y=
Date: Fri, 21 May 2021 16:34:34 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 7/8] x86/insn: Extend error reporting from
 insn_fetch_from_user[_inatomic]()
Message-ID: <YKfE+gfK5AdE9ckm@zn.tnic>
References: <20210519135251.30093-1-joro@8bytes.org>
 <20210519135251.30093-8-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519135251.30093-8-joro@8bytes.org>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Hyunwook Baek <baekhw@google.com>, linux-coco@lists.linux.dev,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

On Wed, May 19, 2021 at 03:52:50PM +0200, Joerg Roedel wrote:
> diff --git a/arch/x86/lib/insn-eval.c b/arch/x86/lib/insn-eval.c
> index 4eecb9c7c6a0..d8a057ba0895 100644
> --- a/arch/x86/lib/insn-eval.c
> +++ b/arch/x86/lib/insn-eval.c
> @@ -1442,27 +1442,36 @@ static int insn_get_effective_ip(struct pt_regs *regs, unsigned long *ip)
>   * insn_fetch_from_user() - Copy instruction bytes from user-space memory
>   * @regs:	Structure with register values as seen when entering kernel mode
>   * @buf:	Array to store the fetched instruction
> + * @copied:	Pointer to an int where the number of copied instruction bytes
> + *		is stored. Can be NULL.
>   *
>   * Gets the linear address of the instruction and copies the instruction bytes
>   * to the buf.
>   *
>   * Returns:
>   *
> - * Number of instruction bytes copied.
> + * -EINVAL if the linear address of the instruction could not be calculated
> + * -EFAULT if nothing was copied
> + *       0 on success
>   *
> - * 0 if nothing was copied.
>   */
> -int insn_fetch_from_user(struct pt_regs *regs, unsigned char buf[MAX_INSN_SIZE])
> +int insn_fetch_from_user(struct pt_regs *regs, unsigned char buf[MAX_INSN_SIZE],
> +			 int *copied)
>  {
>  	unsigned long ip;
>  	int not_copied;
> +	int bytes;
>  
>  	if (insn_get_effective_ip(regs, &ip))
> -		return 0;
> +		return -EINVAL;
>  
>  	not_copied = copy_from_user(buf, (void __user *)ip, MAX_INSN_SIZE);
>  
> -	return MAX_INSN_SIZE - not_copied;
> +	bytes = MAX_INSN_SIZE - not_copied;
> +	if (copied)
> +		*copied = bytes;
> +
> +	return bytes ? 0 : -EFAULT;

Why not simpler?

return value >= 0 says how many bytes were copied
return value < 0 means some kind of error

And then you don't need @copied...

Ditto for the other one.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
