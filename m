Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D691BAEE26
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 17:09:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5E6C6DC8;
	Tue, 10 Sep 2019 15:09:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BEC91AF7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 15:09:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 51AA88A2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 15:09:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 9415AAB6D;
	Tue, 10 Sep 2019 15:09:15 +0000 (UTC)
Subject: Re: [bug report] x86/paravirt: Use a single ops structure
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20190910145320.GA1479@mwanda>
From: Juergen Gross <jgross@suse.com>
Message-ID: <82b0e36b-d6f6-3a5e-9ebe-9675a5764003@suse.com>
Date: Tue, 10 Sep 2019 17:09:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910145320.GA1479@mwanda>
Content-Language: de-DE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,BIGNUM_EMAILS,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 10.09.19 16:53, Dan Carpenter wrote:
> Hello Juergen Gross,
> 
> The patch 5c83511bdb98: "x86/paravirt: Use a single ops structure"
> from Aug 28, 2018, leads to the following static checker warning:
> 
> 	arch/x86/kernel/paravirt.c:123 paravirt_patch_default()
> 	warn: uncapped user index '*(&pv_ops + type)'
> 
> 	arch/x86/kernel/paravirt.c:124 paravirt_patch_default()
> 	error: buffer overflow '&pv_ops' 90 <= 255 user_rl='0-255'
> 
> arch/x86/kernel/paravirt.c
>     116  unsigned paravirt_patch_default(u8 type, void *insn_buff,
>     117                                  unsigned long addr, unsigned len)
>     118  {
>     119          /*
>     120           * Neat trick to map patch type back to the call within the
>     121           * corresponding structure.
>     122           */
>     123          void *opfunc = *((void **)&pv_ops + type);
>                                            ^^^^^^^^^^^^^^
> This code is actually pretty old...
> 
> This isn't a security issue, but the size of &pv_ops is variable but
> type isn't checked so we could be reading beyond the end.  We could do
> something like:
> 
>          if (type >= sizeof(pv_ops) / sizeof(void *))
>                  return -EINVAL;

No, not really. Please check how th return value is being used: it
specifies the length of the instruction to patch. Just returning
-EINVAL would probably clobber most of the kernel.

Please note that type is derived from the pv_ops field names, so
in reality the risk to read beyond the end of pv_ops is zero.


Juergen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
