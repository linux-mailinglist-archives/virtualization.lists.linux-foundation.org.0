Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C35B22CC73
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 19:43:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C875E88A29;
	Fri, 24 Jul 2020 17:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6iGrVeOmZrf; Fri, 24 Jul 2020 17:43:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E7AC888A24;
	Fri, 24 Jul 2020 17:43:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5088C004C;
	Fri, 24 Jul 2020 17:43:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A1B0C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2409024A5C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PC-H3bbtG2Z1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:43:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 9102720020
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:43:09 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l63so5660797pge.12
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 10:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sd5Rp6atrzE1Stcg3iirVnf9ToDQSXxRMnjLTBZ9L1A=;
 b=VWFQY0cDmbN0RBRUPgEZB4t35+VutKPpoaFz/9Te/2hqGPRJlr4gQQD20xOnEsAalg
 q4QdepCDOJhFDcxkYOx0eWXU914L7Wlxsg17nmn6JKAJcVOD226V1u+tZy10pc8p4cZH
 9pTdR/jBEBTnCN1m1IfLHJtg1L0c15Pimq0k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sd5Rp6atrzE1Stcg3iirVnf9ToDQSXxRMnjLTBZ9L1A=;
 b=bLOors7iM78L38h3c7NcqcQb1fapjBD3fOeiqj2Fq7Q8sl6d6SJgmRPUSS6r4lG+CT
 PGFfwIkQSM1c7Ajqs2TLLSe4K8751pjEnDxo/b0gMg/OFgUQT0TGzV2RbJM8hL0pcp5G
 H0EIizztFEIPT5cE/5KXdtWlmVNPZC07l5pky0X7VtuU6r6/7HWYf1yQWf2r0W9MLtNh
 gtE4H8rZQfOKQ5PeM5lH+X+/rczYEldQMwG//ACF3Cpgjya5wIgAvk6MZbAhUk9WwGrB
 qHrSJWgzQLwEpZ4DVRLg1KB7rj+sPmkA1RiZEp+UDQ933tzFKh1yFydrwAFnoqwftgN9
 oOog==
X-Gm-Message-State: AOAM530SmEiqXCBlTSn6fj/vyMduyBsJDyuftp/iw4OECrGSu42pIlK2
 +4l2IVB7afgc8lMQhtwLkUKPjg==
X-Google-Smtp-Source: ABdhPJwJFv2Oz78lM4tZKg9Jhv4RklfsNq7Gh1Z0ycsFgw9wKR0oBpge+dRt0td8MxgcFpPTLwKJLQ==
X-Received: by 2002:a62:a217:: with SMTP id m23mr9922513pff.291.1595612589235; 
 Fri, 24 Jul 2020 10:43:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u16sm6647629pfn.52.2020.07.24.10.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:43:08 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:43:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 33/75] x86/head/64: Switch to initial stack earlier
Message-ID: <202007241043.96A920ADEC@keescook>
References: <20200724160336.5435-1-joro@8bytes.org>
 <20200724160336.5435-34-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724160336.5435-34-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
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

On Fri, Jul 24, 2020 at 06:02:54PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make sure there is a stack once the kernel runs from virual addresses.
> At this stage any secondary CPU which boots will have lost its stack
> because the kernel switched to a new page-table which does not map the
> real-mode stack anymore.
> 
> This is needed for handling early #VC exceptions caused by instructions
> like CPUID.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
