Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7197422733
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:20:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E4C0DCB0;
	Sun, 19 May 2019 16:17:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 65D7D9D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 13:15:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AE88B952
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 13:15:51 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x48DCWFf138907 for <virtualization@lists.linux-foundation.org>;
	Wed, 8 May 2019 09:15:50 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sbxjjw48b-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Wed, 08 May 2019 09:15:49 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<imbrenda@linux.ibm.com>; Wed, 8 May 2019 14:15:46 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 8 May 2019 14:15:43 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x48DFgrD50856020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 8 May 2019 13:15:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11FFC4C050;
	Wed,  8 May 2019 13:15:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BEA34C04A;
	Wed,  8 May 2019 13:15:41 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.155])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  8 May 2019 13:15:41 +0000 (GMT)
Date: Wed, 8 May 2019 15:15:40 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 04/10] s390/mm: force swiotlb for protected virtualization
In-Reply-To: <20190426183245.37939-5-pasic@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-5-pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050813-0020-0000-0000-0000033A8C41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050813-0021-0000-0000-0000218D2D3F
Message-Id: <20190508151540.14ba1d90@p-imbrenda.boeblingen.de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905080084
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	kvm@vger.kernel.org, Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, 26 Apr 2019 20:32:39 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On s390, protected virtualization guests have to use bounced I/O
> buffers.  That requires some plumbing.
> 
> Let us make sure, any device that uses DMA API with direct ops
> correctly is spared from the problems, that a hypervisor attempting
> I/O to a non-shared page would bring.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> ---
>  arch/s390/Kconfig                   |  4 +++
>  arch/s390/include/asm/mem_encrypt.h | 18 +++++++++++++
>  arch/s390/mm/init.c                 | 50
> +++++++++++++++++++++++++++++++++++++ 3 files changed, 72
> insertions(+) create mode 100644 arch/s390/include/asm/mem_encrypt.h
> 
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 1c3fcf19c3af..5500d05d4d53 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -1,4 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
> +config ARCH_HAS_MEM_ENCRYPT
> +        def_bool y
> +
>  config MMU
>  	def_bool y
>  
> @@ -191,6 +194,7 @@ config S390
>  	select ARCH_HAS_SCALED_CPUTIME
>  	select VIRT_TO_BUS
>  	select HAVE_NMI
> +	select SWIOTLB
>  
>  
>  config SCHED_OMIT_FRAME_POINTER
> diff --git a/arch/s390/include/asm/mem_encrypt.h
> b/arch/s390/include/asm/mem_encrypt.h new file mode 100644
> index 000000000000..0898c09a888c
> --- /dev/null
> +++ b/arch/s390/include/asm/mem_encrypt.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef S390_MEM_ENCRYPT_H__
> +#define S390_MEM_ENCRYPT_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +#define sme_me_mask	0ULL

This is rather ugly, but I understand why it's there

> +
> +static inline bool sme_active(void) { return false; }
> +extern bool sev_active(void);
> +
> +int set_memory_encrypted(unsigned long addr, int numpages);
> +int set_memory_decrypted(unsigned long addr, int numpages);
> +
> +#endif	/* __ASSEMBLY__ */
> +
> +#endif	/* S390_MEM_ENCRYPT_H__ */
> +
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 3e82f66d5c61..7e3cbd15dcfa 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -18,6 +18,7 @@
>  #include <linux/mman.h>
>  #include <linux/mm.h>
>  #include <linux/swap.h>
> +#include <linux/swiotlb.h>
>  #include <linux/smp.h>
>  #include <linux/init.h>
>  #include <linux/pagemap.h>
> @@ -29,6 +30,7 @@
>  #include <linux/export.h>
>  #include <linux/cma.h>
>  #include <linux/gfp.h>
> +#include <linux/dma-mapping.h>
>  #include <asm/processor.h>
>  #include <linux/uaccess.h>
>  #include <asm/pgtable.h>
> @@ -42,6 +44,8 @@
>  #include <asm/sclp.h>
>  #include <asm/set_memory.h>
>  #include <asm/kasan.h>
> +#include <asm/dma-mapping.h>
> +#include <asm/uv.h>
>  
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
>  
> @@ -126,6 +130,50 @@ void mark_rodata_ro(void)
>  	pr_info("Write protected read-only-after-init data: %luk\n",
> size >> 10); }
>  
> +int set_memory_encrypted(unsigned long addr, int numpages)
> +{
> +	int i;
> +
> +	/* make all pages shared, (swiotlb, dma_free) */

this is a copypaste typo, I think? (should be UNshared?)
also, it doesn't make ALL pages unshared, but only those specified in
the parameters

with this fixed:
Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> +	for (i = 0; i < numpages; ++i) {
> +		uv_remove_shared(addr);
> +		addr += PAGE_SIZE;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(set_memory_encrypted);
> +
> +int set_memory_decrypted(unsigned long addr, int numpages)
> +{
> +	int i;
> +	/* make all pages shared (swiotlb, dma_alloca) */

same here with ALL

> +	for (i = 0; i < numpages; ++i) {
> +		uv_set_shared(addr);
> +		addr += PAGE_SIZE;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(set_memory_decrypted);
> +
> +/* are we a protected virtualization guest? */
> +bool sev_active(void)

this is also ugly. the correct solution would be probably to refactor
everything, including all the AMD SEV code.... let's not go there

> +{
> +	return is_prot_virt_guest();
> +}
> +EXPORT_SYMBOL_GPL(sev_active);
> +
> +/* protected virtualization */
> +static void pv_init(void)
> +{
> +	if (!sev_active())

can't you just use is_prot_virt_guest here?

> +		return;
> +
> +	/* make sure bounce buffers are shared */
> +	swiotlb_init(1);
> +	swiotlb_update_mem_attributes();
> +	swiotlb_force = SWIOTLB_FORCE;
> +}
> +
>  void __init mem_init(void)
>  {
>  	cpumask_set_cpu(0, &init_mm.context.cpu_attach_mask);
> @@ -134,6 +182,8 @@ void __init mem_init(void)
>  	set_max_mapnr(max_low_pfn);
>          high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
>  
> +	pv_init();
> +
>  	/* Setup guest page hinting */
>  	cmma_init();
>  

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
