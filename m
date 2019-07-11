Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA565F17
	for <lists.virtualization@lfdr.de>; Thu, 11 Jul 2019 19:55:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F2BD154AC;
	Thu, 11 Jul 2019 17:55:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B1A27547F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 17:45:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 29530895
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 17:45:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81A1B5277D;
	Thu, 11 Jul 2019 17:45:42 +0000 (UTC)
Received: from redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with SMTP id A5CA060A97;
	Thu, 11 Jul 2019 17:45:37 +0000 (UTC)
Date: Thu, 11 Jul 2019 13:45:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Subject: Re: [PATCH] virtio_pmem: fix sparse warning
Message-ID: <20190711134403-mutt-send-email-mst@kernel.org>
References: <20190710142700.10215-1-pagupta@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710142700.10215-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 11 Jul 2019 17:45:42 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-nvdimm@lists.01.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
	yuval.shaia@oracle.com, virtualization@lists.linux-foundation.org,
	dan.j.williams@intel.com, lcapitulino@redhat.com
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

On Wed, Jul 10, 2019 at 07:57:00PM +0530, Pankaj Gupta wrote:
> This patch fixes below sparse warning related to __virtio 
> type in virtio pmem driver. This is reported by Intel test
> bot on linux-next tree.
> 
> nd_virtio.c:56:28: warning: incorrect type in assignment (different base types)
> nd_virtio.c:56:28:    expected unsigned int [unsigned] [usertype] type
> nd_virtio.c:56:28:    got restricted __virtio32
> nd_virtio.c:93:59: warning: incorrect type in argument 2 (different base types)
> nd_virtio.c:93:59:    expected restricted __virtio32 [usertype] val
> nd_virtio.c:93:59:    got unsigned int [unsigned] [usertype] ret
> 
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> ---
> 
> This fixes a warning, so submitting it as a separate
> patch on top of virtio pmem series. 
>  
>  include/uapi/linux/virtio_pmem.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/virtio_pmem.h b/include/uapi/linux/virtio_pmem.h
> index efcd72f2d20d..f89129bf1f84 100644
> --- a/include/uapi/linux/virtio_pmem.h
> +++ b/include/uapi/linux/virtio_pmem.h
> @@ -23,12 +23,12 @@ struct virtio_pmem_config {
>  
>  struct virtio_pmem_resp {
>  	/* Host return status corresponding to flush request */
> -	__u32 ret;
> +	__virtio32 ret;
>  };
>  
>  struct virtio_pmem_req {
>  	/* command type */
> -	__u32 type;
> +	__virtio32 type;
>  };
>  
>  #endif

req/resp are in memory right?
Then this looks like a wrong fix.
The accessors should all use cpu_to/from_le
and they types should be __le32.

> -- 
> 2.20.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
