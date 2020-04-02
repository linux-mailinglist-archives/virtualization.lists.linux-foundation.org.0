Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409D19C292
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 15:28:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C209810C1;
	Thu,  2 Apr 2020 13:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0usI7WuGoH3n; Thu,  2 Apr 2020 13:28:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3CB318796B;
	Thu,  2 Apr 2020 13:28:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2ED1BC07FF;
	Thu,  2 Apr 2020 13:28:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E0B7C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 851C420490
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVKgmAXNZN2B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:28:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by silver.osuosl.org (Postfix) with ESMTPS id 98D8F221D9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:28:05 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1FE8C294CC790EBC8BF1;
 Thu,  2 Apr 2020 21:28:00 +0800 (CST)
Received: from [127.0.0.1] (10.173.223.234) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
 Thu, 2 Apr 2020 21:27:56 +0800
Subject: Re: [PATCH -next] virtio-balloon: Make virtballoon_free_page_report
 static
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200402024302.35192-1-yuehaibing@huawei.com>
 <20200402090550-mutt-send-email-mst@kernel.org>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <d1f5d775-17b6-7953-f54a-3adfcea79cfa@huawei.com>
Date: Thu, 2 Apr 2020 21:27:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20200402090550-mutt-send-email-mst@kernel.org>
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On 2020/4/2 21:06, Michael S. Tsirkin wrote:
> On Thu, Apr 02, 2020 at 10:43:02AM +0800, YueHaibing wrote:
>> Fix sparse warning:
>>
>> drivers/virtio/virtio_balloon.c:168:5: warning:
>>  symbol 'virtballoon_free_page_report' was not declared. Should it be static?
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> This is for the mm tree right? You need to tag the subject
> appropriately and copy the relevant lists.

Oh, I should have noticed this, sorry for noise.

> 
>> ---
>>  drivers/virtio/virtio_balloon.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
>> index 0ef16566c3f3..bc10f94718e3 100644
>> --- a/drivers/virtio/virtio_balloon.c
>> +++ b/drivers/virtio/virtio_balloon.c
>> @@ -165,8 +165,9 @@ static void tell_host(struct virtio_balloon *vb, struct virtqueue *vq)
>>  
>>  }
>>  
>> +static
>>  int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_info,
>> -				   struct scatterlist *sg, unsigned int nents)
>> +				 struct scatterlist *sg, unsigned int nents)
>>  {
>>  	struct virtio_balloon *vb =
>>  		container_of(pr_dev_info, struct virtio_balloon, pr_dev_info);
>> -- 
>> 2.17.1
>>
> 
> 
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
