Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D90FAAB0F1
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 05:31:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B9F651652;
	Fri,  6 Sep 2019 03:30:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E6CA4F8E
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 03:30:57 +0000 (UTC)
X-Greylist: delayed 00:08:49 by SQLgrey-1.7.6
Received: from r3-18.sinamail.sina.com.cn (r3-18.sinamail.sina.com.cn
	[202.108.3.18])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id 2B5D4623
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 03:30:56 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.254.173.51])
	by sina.com with ESMTP
	id 5D71D0DB00003D7B; Fri, 6 Sep 2019 11:22:06 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 70821515074454
From: Hillf Danton <hdanton@sina.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 2/2] vhost: re-introducing metadata acceleration through
	kernel virtual address
Date: Fri,  6 Sep 2019 11:21:54 +0800
Message-Id: <20190906032154.9376-1-hdanton@sina.com>
In-Reply-To: <20190905122736.19768-1-jasowang@redhat.com>
References: <20190905122736.19768-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: aarcange@redhat.com, Christoph Hellwig <hch@infradead.org>,
	linux-parisc@vger.kernel.org, kvm@vger.kernel.org,
	mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-mm@kvack.org, jglisse@redhat.com, jgg@mellanox.com,
	David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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


On Thu,  5 Sep 2019 20:27:36 +0800 From:   Jason Wang <jasowang@redhat.com>
> 
> +static void vhost_set_map_dirty(struct vhost_virtqueue *vq,
> +				struct vhost_map *map, int index)
> +{
> +	struct vhost_uaddr *uaddr = &vq->uaddrs[index];
> +	int i;
> +
> +	if (uaddr->write) {
> +		for (i = 0; i < map->npages; i++)
> +			set_page_dirty(map->pages[i]);
> +	}

Not sure need to set page dirty under page lock.


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
