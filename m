Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D17AC7E3
	for <lists.virtualization@lfdr.de>; Sun, 24 Sep 2023 14:12:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D507E60BEC;
	Sun, 24 Sep 2023 12:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D507E60BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DM2MFFv4MnuG; Sun, 24 Sep 2023 12:12:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 699A260BA4;
	Sun, 24 Sep 2023 12:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 699A260BA4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A10BFC008C;
	Sun, 24 Sep 2023 12:12:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20166C0032
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Sep 2023 12:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD7FE81E97
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Sep 2023 12:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD7FE81E97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zPiBIZTXbAM5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Sep 2023 12:11:57 +0000 (UTC)
X-Greylist: delayed 924 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 24 Sep 2023 12:11:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E1A381E87
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E1A381E87
 for <virtualization@lists.linux-foundation.org>;
 Sun, 24 Sep 2023 12:11:56 +0000 (UTC)
Received: from kwepemd500002.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Rtkst1MMZzVk2K;
 Sun, 24 Sep 2023 19:53:22 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 kwepemd500002.china.huawei.com (7.221.188.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.23; Sun, 24 Sep 2023 19:56:26 +0800
Received: from dggpemm500006.china.huawei.com ([7.185.36.236]) by
 dggpemm500006.china.huawei.com ([7.185.36.236]) with mapi id 15.01.2507.031;
 Sun, 24 Sep 2023 19:56:25 +0800
To: Halil Pasic <pasic@linux.ibm.com>
Subject: RE: virtcrypto_dataq_callback calls crypto_finalize_request() from
 irq context
Thread-Topic: virtcrypto_dataq_callback calls crypto_finalize_request() from
 irq context
Thread-Index: AQHZ7VsjRTMxo/hUEkmU1GjtoDjS1rAp3v1A
Date: Sun, 24 Sep 2023 11:56:25 +0000
Message-ID: <ed47fb73ad634ca395bd6c8e979dda8e@huawei.com>
References: <20230922154546.4f7447ce.pasic@linux.ibm.com>
In-Reply-To: <20230922154546.4f7447ce.pasic@linux.ibm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.11]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Marc Hartmayer <mhartmay@linux.ibm.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
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
From: "Gonglei \(Arei\) via Virtualization"
 <virtualization@lists.linux-foundation.org>
Reply-To: "Gonglei \(Arei\)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi Halil,

Commit 4058cf08945 introduced a check for detecting crypto completion function 
called with enable BH, and indeed the virtio-crypto driver didn't disable BH, which needs
a patch to fix it.

P.S.: https://lore.kernel.org/lkml/20220221120833.2618733-5-clabbe@baylibre.com/T/

Regards,
-Gonglei

> -----Original Message-----
> From: Halil Pasic [mailto:pasic@linux.ibm.com]
> Sent: Friday, September 22, 2023 9:46 PM
> To: Gonglei (Arei) <arei.gonglei@huawei.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>; Herbert Xu
> <herbert@gondor.apana.org.au>; Michael S. Tsirkin <mst@redhat.com>;
> Jason Wang <jasowang@redhat.com>;
> virtualization@lists.linux-foundation.org; linux-kernel@vger.kernel.org;
> linux-crypto@vger.kernel.org; Marc Hartmayer <mhartmay@linux.ibm.com>
> Subject: BUG: virtcrypto_dataq_callback calls crypto_finalize_request() from irq
> context
> 
> Hi Gonglei!
> 
> Our CI has found that virtio-crypto does not honor the requirement of
> crypto_finalize_request() being called in softirq context which is asserted in
> that function via lockdep_assert_in_softirq() since commit 4058cf08945c
> ("crypto: engine - check if BH is disabled during completion").
> 
> The problem was originally found on s390x but Marc Hartmayer was so kind to
> reproduce it on amd64. Please find the corresponding kernel messages at the
> end of this email.
> 
> The call chain looks like this.
> interrupt handler for queue notification  --> virtcrypto_dataq_callback()  -->
> via vc_req->alg_cb either virtio_crypto_skcipher_finalize_req()
>      or virtio_crypto_akcipher_finalize_req()
>  --> crypto_finalize_skcipher_request()
>      or crypto_finalize_akcipher_request()
>  --> crypto_finalize_request()
> 
> Everything above is happening in the interrupt handler (and in "hard" irq
> context).
> 
> I'm not really familiar with the implementation of virtio_crypto or with the
> crypto_engine interfaces. I assume the problem is on the side of virtio-crypto
> so I would like to kindly ask you as the maintainer of virtio-crypt to have a look
> at it. But if you think it is rather in the crypto_engine, please clarify that with
> Herbert. I have no strong opinion on this issue.
> 
> Regards,
> Halil
> 
> [ 31.033415][ C0] WARNING: CPU: 0 PID: 136 at crypto/crypto_engine.c:58
> crypto_finalize_request (crypto/crypto_engine.c:58 (discriminator 23))
> crypto_engine
> [   31.034131][    C0] Modules linked in: virtio_crypto(+)
> vmw_vsock_virtio_transport_common(+) crypto_engine vsock
> [   31.035326][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX,
> 1996), BIOS 1.16.2-1.fc38 04/01/2014
> [ 31.035917][ C0] RIP: 0010:crypto_finalize_request (crypto/crypto_engine.c:58
> (discriminator 23)) crypto_engine [ 31.036398][ C0] Code: 08 5b 5d 41 5c 41 5d
> e9 bf 88 1c c1 65 8b 05 b0 36 01 40 f6 c4 ff 74 12 a9 00 00 0f 00 75 0b a9 00 00
> f0 00 0f 84 54 ff ff ff <0f> 0b e9 4d ff ff ff 4c 8d 6b 38 4c 89 ef e8 8e 47 1b c4 48
> 8d bb All code ========
>    0:	08 5b 5d             	or     %bl,0x5d(%rbx)
>    3:	41 5c                	pop    %r12
>    5:	41 5d                	pop    %r13
>    7:	e9 bf 88 1c c1       	jmp    0xffffffffc11c88cb
>    c:	65 8b 05 b0 36 01 40 	mov    %gs:0x400136b0(%rip),%eax
> # 0x400136c3
>   13:	f6 c4 ff             	test   $0xff,%ah
>   16:	74 12                	je     0x2a
>   18:	a9 00 00 0f 00       	test   $0xf0000,%eax
>   1d:	75 0b                	jne    0x2a
>   1f:	a9 00 00 f0 00       	test   $0xf00000,%eax
>   24:	0f 84 54 ff ff ff    	je     0xffffffffffffff7e
>   2a:*	0f 0b                	ud2		<-- trapping instruction
>   2c:	e9 4d ff ff ff       	jmp    0xffffffffffffff7e
>   31:	4c 8d 6b 38          	lea    0x38(%rbx),%r13
>   35:	4c 89 ef             	mov    %r13,%rdi
>   38:	e8 8e 47 1b c4       	call   0xffffffffc41b47cb
>   3d:	48                   	rex.W
>   3e:	8d                   	.byte 0x8d
>   3f:	bb                   	.byte 0xbb
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	0f 0b                	ud2
>    2:	e9 4d ff ff ff       	jmp    0xffffffffffffff54
>    7:	4c 8d 6b 38          	lea    0x38(%rbx),%r13
>    b:	4c 89 ef             	mov    %r13,%rdi
>    e:	e8 8e 47 1b c4       	call   0xffffffffc41b47a1
>   13:	48                   	rex.W
>   14:	8d                   	.byte 0x8d
>   15:	bb                   	.byte 0xbb
> [   31.037591][    C0] RSP: 0018:ffffc90000007da0 EFLAGS: 00010046
> [   31.037976][    C0] RAX: 0000000080010002 RBX: ffff888006c87428 RCX:
> 1ffffffff0c0e523
> [   31.038471][    C0] RDX: 0000000000000000 RSI: ffff88810d0819e8 RDI:
> ffff888006c87449
> [   31.038967][    C0] RBP: ffff88810d0819e8 R08: 0000000000000000 R09:
> fffffbfff0b04f04
> [   31.039463][    C0] R10: ffffffff85827823 R11: ffffffff842013e6 R12:
> 0000000000000000
> [   31.039963][    C0] R13: 0000000000000001 R14: ffff88810d081a18 R15:
> dffffc0000000000
> [   31.040475][    C0] FS:  00007f80c0cc6800(0000)
> GS:ffff88811ae00000(0000) knlGS:0000000000000000
> [   31.041058][    C0] CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> [   31.041473][    C0] CR2: 00007f22ad455270 CR3: 0000000106b22000
> CR4: 00000000000006f0
> [   31.042024][    C0] Call Trace:
> [   31.042250][    C0]  <IRQ>
> [ 31.042433][ C0] ? __warn (kernel/panic.c:673) [ 31.042710][ C0] ?
> crypto_finalize_request (crypto/crypto_engine.c:58 (discriminator 23))
> crypto_engine [ 31.043161][ C0] ? report_bug (lib/bug.c:180 lib/bug.c:219)
> [ 31.043451][ C0] ? handle_bug (arch/x86/kernel/traps.c:237 (discriminator 1))
> [ 31.043728][ C0] ? exc_invalid_op (arch/x86/kernel/traps.c:258 (discriminator
> 1)) [ 31.044039][ C0] ? asm_exc_invalid_op
> (./arch/x86/include/asm/idtentry.h:568)
> [ 31.044385][ C0] ? asm_common_interrupt
> (./arch/x86/include/asm/idtentry.h:636)
> [ 31.044746][ C0] ? crypto_finalize_request (crypto/crypto_engine.c:58
> (discriminator 23)) crypto_engine [ 31.045202][ C0] virtcrypto_dataq_callback
> (drivers/crypto/virtio/virtio_crypto_core.c:91) virtio_crypto [ 31.045661][ C0] ?
> __pfx_virtcrypto_dataq_callback (drivers/crypto/virtio/virtio_crypto_core.c:76)
> virtio_crypto [ 31.046148][ C0] ? __pfx_do_raw_spin_lock
> (kernel/locking/spinlock_debug.c:113)
> [ 31.046499][ C0] vring_interrupt (drivers/virtio/virtio_ring.c:2598)
> [ 31.046806][ C0] vp_vring_interrupt (drivers/virtio/virtio_pci_common.c:67
> (discriminator 2)) [ 31.047125][ C0] ? __pfx_vp_vring_interrupt
> (drivers/virtio/virtio_pci_common.c:60)
> [ 31.047477][ C0] __handle_irq_event_percpu (kernel/irq/handle.c:158)
> [ 31.047845][ C0] handle_irq_event (kernel/irq/handle.c:195
> kernel/irq/handle.c:210) [ 31.048147][ C0] handle_edge_irq
> (kernel/irq/chip.c:833) [ 31.048454][ C0] __common_interrupt
> (arch/x86/kernel/irq.c:271) [ 31.048767][ C0] common_interrupt
> (arch/x86/kernel/irq.c:247 (discriminator 47))
> [   31.049071][    C0]  </IRQ>
> [   31.049273][    C0]  <TASK>
> [ 31.049468][ C0] asm_common_interrupt
> (./arch/x86/include/asm/idtentry.h:636)
> [ 31.049805][ C0] RIP: 0010:unwind_next_frame
> (arch/x86/kernel/unwind_orc.c:494)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
