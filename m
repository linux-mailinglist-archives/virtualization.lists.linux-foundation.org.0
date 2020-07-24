Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A4E22CCA9
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 19:56:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0CE7388A2F;
	Fri, 24 Jul 2020 17:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2qFZBa+Ot0Q; Fri, 24 Jul 2020 17:55:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5E11688A28;
	Fri, 24 Jul 2020 17:55:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 435DAC004C;
	Fri, 24 Jul 2020 17:55:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7465EC004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 63BD68727B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCFNtlcgVOwH
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:55:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E8F2C87252
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:55:54 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id l6so4896882plt.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 10:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QrjebX+2MVOIfEwIWOQEBEmYNWrE9lHIByJGfCaahp0=;
 b=hpYudzwzACcZEpNTXqhIf8svOe4F5gdhGn3v/8i/VFeHAJKdvEe7O8ZFIQ/2xPOfM5
 eUZZk0JqNgrmR8+mnIW+v60vhGaERWbXIJj0woZtDy5keFrTIVcMoqzC0Bq/uE4CvYE3
 +ouQm9QjiTT6IYzRowgORlrhQ4w5uXgmCxi4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QrjebX+2MVOIfEwIWOQEBEmYNWrE9lHIByJGfCaahp0=;
 b=VTQvWXXejQCjnRzWT8IG55E64FYP2aWPiyaQ2jZdBOeHbHuJSutodvcGIHvrlbAv1B
 OkI46xFr5W1UC5ya9ME/JoR+oKX3vIgumB2crq7nAhgEVBDAea/Rtshq2OEScQtdEilw
 q4wHgZ6dOeusFv8j8URg64tjsAB8p4X6QrnDcIRoxLWWEJtKdGmNj0FH1ROHvyJW/AmC
 J4TVnliQ67wyp0PFCd9x/hbtj6bNcbhWYUcmkv5k2sN9EnJqgWm41h7b3tfPVEVcEoW4
 wIpynWazdzZxSVXUSeSPbUUo5XU4inKa+HsEXT4mvs/JY1S+fP74t6Gf3vOhazVPv5MQ
 YhoA==
X-Gm-Message-State: AOAM530tjrr2CaxLMRL1G3Yb+oUFtXleVF7H8gFhKPkQCHyk8FxZcUor
 ycJ0+I4SGHGYvnEbL9T2PU5kiA==
X-Google-Smtp-Source: ABdhPJw33GS/18bzdmYBhAOo0OUTefZ+sCJH0t7Z7U3EzxF0uRV20RMB2IXpc67zADTPhpGVqdwIsQ==
X-Received: by 2002:a17:902:e901:: with SMTP id
 k1mr9615159pld.130.1595613354599; 
 Fri, 24 Jul 2020 10:55:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t1sm6805590pgq.66.2020.07.24.10.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:55:53 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:55:52 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 75/75] x86/sev-es: Check required CPU features for
 SEV-ES
Message-ID: <202007241055.655EFCB4@keescook>
References: <20200724160336.5435-1-joro@8bytes.org>
 <20200724160336.5435-76-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724160336.5435-76-joro@8bytes.org>
Cc: Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Juergen Gross <jgross@suse.com>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
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

On Fri, Jul 24, 2020 at 06:03:36PM +0200, Joerg Roedel wrote:
> From: Martin Radev <martin.b.radev@gmail.com>
> 
> Make sure the machine supports RDRAND, otherwise there is no trusted
> source of of randomness in the system.
> 
> To also check this in the pre-decompression stage, make has_cpuflag
> not depend on CONFIG_RANDOMIZE_BASE anymore.
> 
> Signed-off-by: Martin Radev <martin.b.radev@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
