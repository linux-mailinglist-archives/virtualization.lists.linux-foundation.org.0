Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9857668620
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 11:16:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B3E37CB2;
	Mon, 15 Jul 2019 09:16:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 01E2CCA8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 09:16:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5565E876
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 09:16:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D28F13082B46;
	Mon, 15 Jul 2019 09:16:19 +0000 (UTC)
Received: from [10.72.12.123] (ovpn-12-123.pek2.redhat.com [10.72.12.123])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A4D45C231;
	Mon, 15 Jul 2019 09:16:10 +0000 (UTC)
Subject: Re: [RFC] virtio-net: share receive_*() and add_recvbuf_*() with
	virtio-vsock
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190710153707.twmzgmwqqw3pstos@steredhat>
	<9574bc38-4c5c-2325-986b-430e4a2b6661@redhat.com>
	<20190711114134.xhmpciyglb2angl6@steredhat>
	<20190711152855-mutt-send-email-mst@kernel.org>
	<20190712100033.xs3xesz2plfwj3ag@steredhat>
	<a514d8a4-3a12-feeb-4467-af7a9fbf5183@redhat.com>
	<20190715074416.a3s2i5ausognotbn@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <880c1ad2-7e02-3d5d-82d7-49076cc8d02b@redhat.com>
Date: Mon, 15 Jul 2019 17:16:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715074416.a3s2i5ausognotbn@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 15 Jul 2019 09:16:19 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
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


>>>>>>>        struct sk_buff *virtskb_receive_small(struct virtskb *vs, ...);
>>>>>>>        struct sk_buff *virtskb_receive_big(struct virtskb *vs, ...);
>>>>>>>        struct sk_buff *virtskb_receive_mergeable(struct virtskb *vs, ...);
>>>>>>>
>>>>>>>        int virtskb_add_recvbuf_small(struct virtskb*vs, ...);
>>>>>>>        int virtskb_add_recvbuf_big(struct virtskb *vs, ...);
>>>>>>>        int virtskb_add_recvbuf_mergeable(struct virtskb *vs, ...);
>>>>>>>
>>>>>>> For the Guest->Host path it should be easier, so maybe I can add a
>>>>>>> "virtskb_send(struct virtskb *vs, struct sk_buff *skb)" with a part of the code
>>>>>>> of xmit_skb().
>>>>>> I may miss something, but I don't see any thing that prevents us from using
>>>>>> xmit_skb() directly.
>>>>>>
>>>>> Yes, but my initial idea was to make it more parametric and not related to the
>>>>> virtio_net_hdr, so the 'hdr_len' could be a parameter and the
>>>>> 'num_buffers' should be handled by the caller.
>>>>>
>>>>>>> Let me know if you have in mind better names or if I should put these function
>>>>>>> in another place.
>>>>>>>
>>>>>>> I would like to leave the control part completely separate, so, for example,
>>>>>>> the two drivers will negotiate the features independently and they will call
>>>>>>> the right virtskb_receive_*() function based on the negotiation.
>>>>>> If it's one the issue of negotiation, we can simply change the
>>>>>> virtnet_probe() to deal with different devices.
>>>>>>
>>>>>>
>>>>>>> I already started to work on it, but before to do more steps and send an RFC
>>>>>>> patch, I would like to hear your opinion.
>>>>>>> Do you think that makes sense?
>>>>>>> Do you see any issue or a better solution?
>>>>>> I still think we need to seek a way of adding some codes on virtio-net.c
>>>>>> directly if there's no huge different in the processing of TX/RX. That would
>>>>>> save us a lot time.
>>>>> After the reading of the buffers from the virtqueue I think the process
>>>>> is slightly different, because virtio-net will interface with the network
>>>>> stack, while virtio-vsock will interface with the vsock-core (socket).
>>>>> So the virtio-vsock implements the following:
>>>>> - control flow mechanism to avoid to loose packets, informing the peer
>>>>>     about the amount of memory available in the receive queue using some
>>>>>     fields in the virtio_vsock_hdr
>>>>> - de-multiplexing parsing the virtio_vsock_hdr and choosing the right
>>>>>     socket depending on the port
>>>>> - socket state handling
>>
>> I think it's just a branch, for ethernet, go for networking stack. otherwise
>> go for vsock core?
>>
> Yes, that should work.
>
> So, I should refactor the functions that can be called also from the vsock
> core, in order to remove "struct net_device *dev" parameter.
> Maybe creating some wrappers for the network stack.
>
> Otherwise I should create a fake net_device for vsock_core.
>
> What do you suggest?


I'm not quite sure I get the question. Can you just use the one that 
created by virtio_net?


Thanks
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
