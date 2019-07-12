Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 885EA6713A
	for <lists.virtualization@lfdr.de>; Fri, 12 Jul 2019 16:18:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1099F595E;
	Fri, 12 Jul 2019 14:18:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1FE2C5577
	for <virtualization@lists.linux-foundation.org>;
	Fri, 12 Jul 2019 14:11:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 956FA88E
	for <virtualization@lists.linux-foundation.org>;
	Fri, 12 Jul 2019 14:11:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0979930821C2;
	Fri, 12 Jul 2019 14:11:00 +0000 (UTC)
Received: from redhat.com (ovpn-116-209.ams2.redhat.com [10.36.116.209])
	by smtp.corp.redhat.com (Postfix) with SMTP id 7C6D31001B11;
	Fri, 12 Jul 2019 14:10:52 +0000 (UTC)
Date: Fri, 12 Jul 2019 10:10:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Subject: Re: [PATCH v3] virtio_pmem: fix sparse warning
Message-ID: <20190712101021-mutt-send-email-mst@kernel.org>
References: <20190712051610.15478-1-pagupta@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712051610.15478-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 12 Jul 2019 14:11:00 +0000 (UTC)
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

On Fri, Jul 12, 2019 at 10:46:10AM +0530, Pankaj Gupta wrote:
> This patch fixes below sparse warning related to __virtio
> type in virtio pmem driver. This is reported by Intel test
> bot on linux-next tree.
> 
> nd_virtio.c:56:28: warning: incorrect type in assignment
>                                 (different base types)
> nd_virtio.c:56:28:    expected unsigned int [unsigned] [usertype] type
> nd_virtio.c:56:28:    got restricted __virtio32
> nd_virtio.c:93:59: warning: incorrect type in argument 2
>                                 (different base types)
> nd_virtio.c:93:59:    expected restricted __virtio32 [usertype] val
> nd_virtio.c:93:59:    got unsigned int [unsigned] [usertype] ret
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Pls merge - I assume nvdimm tree?

> ---
> This fixes a warning, so submitting it as a separate
> patch on top of virtio pmem series.
> 
> v2-> v3
>  Use __le for req/resp fields - Michael
> 
>  drivers/nvdimm/nd_virtio.c       | 4 ++--
>  include/uapi/linux/virtio_pmem.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvdimm/nd_virtio.c b/drivers/nvdimm/nd_virtio.c
> index 8645275c08c2..10351d5b49fa 100644
> --- a/drivers/nvdimm/nd_virtio.c
> +++ b/drivers/nvdimm/nd_virtio.c
> @@ -53,7 +53,7 @@ static int virtio_pmem_flush(struct nd_region *nd_region)
>  	init_waitqueue_head(&req_data->host_acked);
>  	init_waitqueue_head(&req_data->wq_buf);
>  	INIT_LIST_HEAD(&req_data->list);
> -	req_data->req.type = cpu_to_virtio32(vdev, VIRTIO_PMEM_REQ_TYPE_FLUSH);
> +	req_data->req.type = cpu_to_le32(VIRTIO_PMEM_REQ_TYPE_FLUSH);
>  	sg_init_one(&sg, &req_data->req, sizeof(req_data->req));
>  	sgs[0] = &sg;
>  	sg_init_one(&ret, &req_data->resp.ret, sizeof(req_data->resp));
> @@ -90,7 +90,7 @@ static int virtio_pmem_flush(struct nd_region *nd_region)
>  	} else {
>  		/* A host repsonse results in "host_ack" getting called */
>  		wait_event(req_data->host_acked, req_data->done);
> -		err = virtio32_to_cpu(vdev, req_data->resp.ret);
> +		err = le32_to_cpu(req_data->resp.ret);
>  	}
>  
>  	kfree(req_data);
> diff --git a/include/uapi/linux/virtio_pmem.h b/include/uapi/linux/virtio_pmem.h
> index efcd72f2d20d..9a63ed6d062f 100644
> --- a/include/uapi/linux/virtio_pmem.h
> +++ b/include/uapi/linux/virtio_pmem.h
> @@ -23,12 +23,12 @@ struct virtio_pmem_config {
>  
>  struct virtio_pmem_resp {
>  	/* Host return status corresponding to flush request */
> -	__u32 ret;
> +	__le32 ret;
>  };
>  
>  struct virtio_pmem_req {
>  	/* command type */
> -	__u32 type;
> +	__le32 type;
>  };
>  
>  #endif
> -- 
> 2.14.5
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
