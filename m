Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C18D82273D
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:21:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CF6D4C3A;
	Sun, 19 May 2019 16:17:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 07E5BE55
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 18:05:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E99D87DB
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 18:05:28 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x49Hv952001819 for <virtualization@lists.linux-foundation.org>;
	Thu, 9 May 2019 14:05:28 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2scr8mjfed-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 09 May 2019 14:05:28 -0400
Received: from localhost
	by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<jjherne@linux.ibm.com>; Thu, 9 May 2019 19:05:26 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
	by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 9 May 2019 19:05:24 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
	[9.57.199.106])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x49I5L1X34144330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 9 May 2019 18:05:21 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80CF228066;
	Thu,  9 May 2019 18:05:21 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2287428060;
	Thu,  9 May 2019 18:05:21 +0000 (GMT)
Received: from [9.60.75.213] (unknown [9.60.75.213])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu,  9 May 2019 18:05:21 +0000 (GMT)
Subject: Re: [PATCH 04/10] s390/mm: force swiotlb for protected virtualization
To: Halil Pasic <pasic@linux.ibm.com>, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, "Cornelia Huck ," <cohuck@redhat.com>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Sebastian Ott <sebott@linux.ibm.com>
References: <20190426183245.37939-5-pasic@linux.ibm.com>
	<ad23f5e7-dc78-04af-c892-47bbc65134c6@linux.ibm.com>
From: "Jason J. Herne" <jjherne@linux.ibm.com>
Organization: IBM
Date: Thu, 9 May 2019 14:05:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <ad23f5e7-dc78-04af-c892-47bbc65134c6@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050918-0060-0000-0000-0000033E0CE0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011078; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000285; SDB=6.01200929; UDB=6.00630161;
	IPR=6.00981820; 
	MB=3.00026815; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-09 18:05:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050918-0061-0000-0000-000049494241
Message-Id: <4c7a990a-7f11-17f3-2024-18acaf7ceb06@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905090103
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: Christoph Hellwig <hch@infradead.org>, "Thomas Huth , " <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, "Vasily Gorbik ,
	" <gor@linux.ibm.com>, "Michael S. Tsirkin , " <mst@redhat.com>,
	Farhan Ali <alifm@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>
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
Reply-To: jjherne@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

> Subject: [PATCH 04/10] s390/mm: force swiotlb for protected virtualization
> Date: Fri, 26 Apr 2019 20:32:39 +0200
> From: Halil Pasic <pasic@linux.ibm.com>
> To: kvm@vger.kernel.org, linux-s390@vger.kernel.org, Cornelia Huck <cohuc=
k@redhat.com>, =

> Martin Schwidefsky <schwidefsky@de.ibm.com>, Sebastian Ott <sebott@linux.=
ibm.com>
> CC: Halil Pasic <pasic@linux.ibm.com>, virtualization@lists.linux-foundat=
ion.org, Michael =

> S. Tsirkin <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>, Thoma=
s Huth =

> <thuth@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Vikto=
r Mihajlovski =

> <mihajlov@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Janosch Fran=
k =

> <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Farha=
n Ali =

> <alifm@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
> =

> On s390, protected virtualization guests have to use bounced I/O
> buffers.=A0 That requires some plumbing.
> =

> Let us make sure, any device that uses DMA API with direct ops correctly
> is spared from the problems, that a hypervisor attempting I/O to a
> non-shared page would bring.
> =

> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> ---
>  =A0arch/s390/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 4 +++
>  =A0arch/s390/include/asm/mem_encrypt.h | 18 +++++++++++++
>  =A0arch/s390/mm/init.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
 50 +++++++++++++++++++++++++++++++++++++
>  =A03 files changed, 72 insertions(+)
>  =A0create mode 100644 arch/s390/include/asm/mem_encrypt.h
> =

> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 1c3fcf19c3af..5500d05d4d53 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -1,4 +1,7 @@
>  =A0# SPDX-License-Identifier: GPL-2.0
> +config ARCH_HAS_MEM_ENCRYPT
> +=A0=A0=A0=A0=A0=A0=A0 def_bool y
> +
>  =A0config MMU
>  =A0=A0=A0=A0 def_bool y
>  =A0@@ -191,6 +194,7 @@ config S390
>  =A0=A0=A0=A0 select ARCH_HAS_SCALED_CPUTIME
>  =A0=A0=A0=A0 select VIRT_TO_BUS
>  =A0=A0=A0=A0 select HAVE_NMI
> +=A0=A0=A0 select SWIOTLB
>  =A0=A0 config SCHED_OMIT_FRAME_POINTER
> diff --git a/arch/s390/include/asm/mem_encrypt.h b/arch/s390/include/asm/=
mem_encrypt.h
> new file mode 100644
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
> +#define sme_me_mask=A0=A0=A0 0ULL
> +
> +static inline bool sme_active(void) { return false; }
> +extern bool sev_active(void);
> +

I noticed this patch always returns false for sme_active. Is it safe to ass=
ume that =

whatever fixups are required on x86 to deal with sme do not apply to s390?

> +int set_memory_encrypted(unsigned long addr, int numpages);
> +int set_memory_decrypted(unsigned long addr, int numpages);
> +
> +#endif=A0=A0=A0 /* __ASSEMBLY__ */
> +
> +#endif=A0=A0=A0 /* S390_MEM_ENCRYPT_H__ */
> +
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 3e82f66d5c61..7e3cbd15dcfa 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -18,6 +18,7 @@
>  =A0#include <linux/mman.h>
>  =A0#include <linux/mm.h>
>  =A0#include <linux/swap.h>
> +#include <linux/swiotlb.h>
>  =A0#include <linux/smp.h>
>  =A0#include <linux/init.h>
>  =A0#include <linux/pagemap.h>
> @@ -29,6 +30,7 @@
>  =A0#include <linux/export.h>
>  =A0#include <linux/cma.h>
>  =A0#include <linux/gfp.h>
> +#include <linux/dma-mapping.h>
>  =A0#include <asm/processor.h>
>  =A0#include <linux/uaccess.h>
>  =A0#include <asm/pgtable.h>
> @@ -42,6 +44,8 @@
>  =A0#include <asm/sclp.h>
>  =A0#include <asm/set_memory.h>
>  =A0#include <asm/kasan.h>
> +#include <asm/dma-mapping.h>
> +#include <asm/uv.h>
>  =A0 pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
>  =A0@@ -126,6 +130,50 @@ void mark_rodata_ro(void)
>  =A0=A0=A0=A0 pr_info("Write protected read-only-after-init data: %luk\n"=
, size >> 10);
>  =A0}
>  =A0+int set_memory_encrypted(unsigned long addr, int numpages)
> +{
> +=A0=A0=A0 int i;
> +
> +=A0=A0=A0 /* make all pages shared, (swiotlb, dma_free) */

This comment should be "make all pages unshared"?

> +=A0=A0=A0 for (i =3D 0; i < numpages; ++i) {
> +=A0=A0=A0=A0=A0=A0=A0 uv_remove_shared(addr);
> +=A0=A0=A0=A0=A0=A0=A0 addr +=3D PAGE_SIZE;
> +=A0=A0=A0 }
> +=A0=A0=A0 return 0;
> +}
> +EXPORT_SYMBOL_GPL(set_memory_encrypted);
> +
> +int set_memory_decrypted(unsigned long addr, int numpages)
> +{
> +=A0=A0=A0 int i;
> +=A0=A0=A0 /* make all pages shared (swiotlb, dma_alloca) */
> +=A0=A0=A0 for (i =3D 0; i < numpages; ++i) {
> +=A0=A0=A0=A0=A0=A0=A0 uv_set_shared(addr);
> +=A0=A0=A0=A0=A0=A0=A0 addr +=3D PAGE_SIZE;
> +=A0=A0=A0 }
> +=A0=A0=A0 return 0;
> +}
> +EXPORT_SYMBOL_GPL(set_memory_decrypted);

The addr arguments for the above functions appear to be referring to virtua=
l addresses. =

Would vaddr be a better name?

> +
> +/* are we a protected virtualization guest? */
> +bool sev_active(void)
> +{
> +=A0=A0=A0 return is_prot_virt_guest();
> +}
> +EXPORT_SYMBOL_GPL(sev_active);
> +
> +/* protected virtualization */
> +static void pv_init(void)
> +{
> +=A0=A0=A0 if (!sev_active())
> +=A0=A0=A0=A0=A0=A0=A0 return;
> +
> +=A0=A0=A0 /* make sure bounce buffers are shared */
> +=A0=A0=A0 swiotlb_init(1);
> +=A0=A0=A0 swiotlb_update_mem_attributes();
> +=A0=A0=A0 swiotlb_force =3D SWIOTLB_FORCE;
> +}
> +
>  =A0void __init mem_init(void)
>  =A0{
>  =A0=A0=A0=A0 cpumask_set_cpu(0, &init_mm.context.cpu_attach_mask);
> @@ -134,6 +182,8 @@ void __init mem_init(void)
>  =A0=A0=A0=A0 set_max_mapnr(max_low_pfn);
>  =A0=A0=A0=A0=A0=A0=A0=A0 high_memory =3D (void *) __va(max_low_pfn * PAG=
E_SIZE);
>  =A0+=A0=A0=A0 pv_init();
> +
>  =A0=A0=A0=A0 /* Setup guest page hinting */
>  =A0=A0=A0=A0 cmma_init();
>  =A0-- 2.16.4
> =

> =


-- =

-- Jason J. Herne (jjherne@linux.ibm.com)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
