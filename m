Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B015BB683
	for <lists.virtualization@lfdr.de>; Sat, 17 Sep 2022 07:26:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F77C40153;
	Sat, 17 Sep 2022 05:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F77C40153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYvneAsLLu3T; Sat, 17 Sep 2022 05:25:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E3EAA4018B;
	Sat, 17 Sep 2022 05:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3EAA4018B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C9EEC007C;
	Sat, 17 Sep 2022 05:25:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0879AC002D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Sep 2022 05:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D756361044
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Sep 2022 05:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D756361044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFvhiQ2oYAgT
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Sep 2022 05:25:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F30960D4E
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F30960D4E
 for <virtualization@lists.linux-foundation.org>;
 Sat, 17 Sep 2022 05:25:52 +0000 (UTC)
Received: from c-24-17-218-140.hsd1.wa.comcast.net ([24.17.218.140]
 helo=srivatsab-a02.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1oZQKc-001ohd-JP;
 Sat, 17 Sep 2022 01:25:34 -0400
Subject: Re: [PATCH v2] jailhouse: Hold reference returned from of_find_xxx API
To: Liang He <windhl@126.com>, jgross@suse.com,
 virtualization@lists.linux-foundation.org
References: <20220916090051.4096328-1-windhl@126.com>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Message-ID: <0069849b-e6c7-5c9b-4b52-5aa6e4a328e4@csail.mit.edu>
Date: Fri, 16 Sep 2022 22:25:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20220916090051.4096328-1-windhl@126.com>
Content-Language: en-US
Cc: jailhouse-dev@googlegroups.com, mark.rutland@arm.com,
 jan.kiszka@siemens.com, andy.shevchenko@gmail.com, robh+dt@kernel.org,
 wangkelin2023@163.com, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>
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

[ Adding author and reviewers of commit 63338a38db95 again ]

On 9/16/22 2:00 AM, Liang He wrote:
> In jailhouse_paravirt(), we should hold the reference returned from
> of_find_compatible_node() which has increased the refcount and then
> call of_node_put() with it when done.
> 
> Fixes: 63338a38db95 ("jailhouse: Provide detection for non-x86 systems")
> Signed-off-by: Liang He <windhl@126.com>
> Co-developed-by: Kelin Wang <wangkelin2023@163.com>
> Signed-off-by: Kelin Wang <wangkelin2023@163.com>

Reviewed-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>

> ---
> 
>  v2: use proper return type not the 'np' pointer
> 
>  include/linux/hypervisor.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/hypervisor.h b/include/linux/hypervisor.h
> index 9efbc54e35e5..f11eec57ea63 100644
> --- a/include/linux/hypervisor.h
> +++ b/include/linux/hypervisor.h
> @@ -27,7 +27,11 @@ static inline void hypervisor_pin_vcpu(int cpu)
>  
>  static inline bool jailhouse_paravirt(void)
>  {
> -	return of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> +	struct device_node *np = of_find_compatible_node(NULL, NULL, "jailhouse,cell");
> +
> +	of_node_put(np);
> +
> +	return np ? true : false;
>  }
>  
>  #endif /* !CONFIG_X86 */
>

Regards,
Srivatsa
VMware Photon OS
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
