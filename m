Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id CC89679A9CA
	for <lists.virtualization@lfdr.de>; Mon, 11 Sep 2023 17:34:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7D5F60806;
	Mon, 11 Sep 2023 15:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7D5F60806
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MMbbB73E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39C5W-lyqHqr; Mon, 11 Sep 2023 15:34:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9D4E260B15;
	Mon, 11 Sep 2023 15:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D4E260B15
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0160C007F;
	Mon, 11 Sep 2023 15:34:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD955C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Sep 2023 15:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7FBA60ADE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Sep 2023 15:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7FBA60ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L4AqEPC1FNbI
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Sep 2023 15:34:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0CD060806
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Sep 2023 15:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0CD060806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694446456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0hlG5FAGp8RmPoZ3E3s3/+3No0cdG4KvSkd6VNEwic=;
 b=MMbbB73EJxMAWIgNw4RPxYVNLQK5Zb55y47B8w8RJ14Q+5LFjHlO9gAGxsoF21nssDYCk6
 92RuMMgRhqIp3umG0HjnFzCEI4o3a08aUOFWYP3bYY1v1O9VAI8jy3vapj4El1vq9tNHXS
 sMA4hOMy91gslIhUAhpUf0fiAPk5GVs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-7swe91uhPdmELgDadpzMYA-1; Mon, 11 Sep 2023 11:34:13 -0400
X-MC-Unique: 7swe91uhPdmELgDadpzMYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D615183689B;
 Mon, 11 Sep 2023 15:34:11 +0000 (UTC)
Received: from [10.22.32.237] (unknown [10.22.32.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D391140C6EBF;
 Mon, 11 Sep 2023 15:34:09 +0000 (UTC)
Message-ID: <5ba0b8f3-f8f5-3a25-e9b7-f29a1abe654a@redhat.com>
Date: Mon, 11 Sep 2023 11:34:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V11 07/17] riscv: qspinlock: Introduce qspinlock param for
 command line
Content-Language: en-US
To: guoren@kernel.org, paul.walmsley@sifive.com, anup@brainfault.org,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 palmer@rivosinc.com, boqun.feng@gmail.com, tglx@linutronix.de,
 paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
 catalin.marinas@arm.com, conor.dooley@microchip.com,
 xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com,
 keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com,
 jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
 leobras@redhat.com
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-8-guoren@kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20230910082911.3378782-8-guoren@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Cc: linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-csky@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-riscv@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 9/10/23 04:29, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Allow cmdline to force the kernel to use queued_spinlock when
> CONFIG_RISCV_COMBO_SPINLOCKS=y.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>   Documentation/admin-guide/kernel-parameters.txt |  2 ++
>   arch/riscv/kernel/setup.c                       | 16 +++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 7dfb540c4f6c..61cacb8dfd0e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4693,6 +4693,8 @@
>   			[KNL] Number of legacy pty's. Overwrites compiled-in
>   			default number.
>   
> +	qspinlock	[RISCV] Force to use qspinlock or auto-detect spinlock.
> +
>   	qspinlock.numa_spinlock_threshold_ns=	[NUMA, PV_OPS]
>   			Set the time threshold in nanoseconds for the
>   			number of intra-node lock hand-offs before the
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index a447cf360a18..0f084f037651 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -270,6 +270,15 @@ static void __init parse_dtb(void)
>   }
>   
>   #ifdef CONFIG_RISCV_COMBO_SPINLOCKS
> +bool enable_qspinlock_key = false;

You can use __ro_after_init qualifier for enable_qspinlock_key. BTW, 
this is not a static key, just a simple flag. So what is the point of 
the _key suffix?

Cheers,
Longman

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
