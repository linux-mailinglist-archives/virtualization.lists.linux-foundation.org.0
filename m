Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D40649E6
	for <lists.virtualization@lfdr.de>; Wed, 10 Jul 2019 17:43:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 488584591;
	Wed, 10 Jul 2019 15:43:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EF5494586
	for <virtualization@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 15:37:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 73C0D883
	for <virtualization@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 15:37:11 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id n9so2979612wrr.4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 08:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=w6gOM0EF8w6OgRkN0S1HwMV2ZTxvl6sDwbz7UvtM7Ds=;
	b=EEHXoDPdS9TepWDl41ppjIz0wLAfEd3TlOdarjGut9/+M2XF0uYQ4zXqwyAM/RILBd
	qXGpIDRWaTiZeTp4VoGppD7NnV3v/fLN3XIjYAiNMUE5IcKDbpCY8sbM5fr/d2u6H7Ae
	ppBreR8Utt4diTqBByKcaAcMG5DY0styrKpRYS0wdTWCJXwmhx89ADjUMtw3L7nKTarF
	SSBJfa1+isB6S0UnfX7NtI5MUfbXwSSwDs+1+yc30eua7u7Vaw53S+J97NvzoqyqHFw5
	z1tnuqxyhiHeld4uVLMxaXp8eM1i+V1JAewRErCN+dJrpeiuh6FF1ba/39Ky8/H/pqWC
	iBog==
X-Gm-Message-State: APjAAAVV+I1kLTjG2g+06WcQtIPJveTa8WX7Cdt3yidSzfK1uLb1PzHo
	8/Yqm+1D+0Q/fUnd32Htbn7b/A==
X-Google-Smtp-Source: APXvYqw5KGnsPShaRheRWeLkyw7iNHfzH6H8mZGknsxq9TfA80oFKuQNpokcGJJXQu9Hu6et/y/htg==
X-Received: by 2002:a5d:468a:: with SMTP id u10mr32491868wrq.177.1562773029910;
	Wed, 10 Jul 2019 08:37:09 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122])
	by smtp.gmail.com with ESMTPSA id 15sm1847474wmk.34.2019.07.10.08.37.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 08:37:09 -0700 (PDT)
Date: Wed, 10 Jul 2019 17:37:07 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [RFC] virtio-net: share receive_*() and add_recvbuf_*() with
	virtio-vsock
Message-ID: <20190710153707.twmzgmwqqw3pstos@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Hi,
as Jason suggested some months ago, I looked better at the virtio-net driver to
understand if we can reuse some parts also in the virtio-vsock driver, since we
have similar challenges (mergeable buffers, page allocation, small
packets, etc.).

Initially, I would add the skbuff in the virtio-vsock in order to re-use
receive_*() functions.
Then I would move receive_[small, big, mergeable]() and
add_recvbuf_[small, big, mergeable]() outside of virtio-net driver, in order to
call them also from virtio-vsock. I need to do some refactoring (e.g. leave the
XDP part on the virtio-net driver), but I think it is feasible.

The idea is to create a virtio-skb.[h,c] where put these functions and a new
object where stores some attributes needed (e.g. hdr_len ) and status (e.g.
some fields of struct receive_queue). This is an idea of virtio-skb.h that
I have in mind:
    struct virtskb;

    struct sk_buff *virtskb_receive_small(struct virtskb *vs, ...);
    struct sk_buff *virtskb_receive_big(struct virtskb *vs, ...);
    struct sk_buff *virtskb_receive_mergeable(struct virtskb *vs, ...);

    int virtskb_add_recvbuf_small(struct virtskb*vs, ...);
    int virtskb_add_recvbuf_big(struct virtskb *vs, ...);
    int virtskb_add_recvbuf_mergeable(struct virtskb *vs, ...);

For the Guest->Host path it should be easier, so maybe I can add a
"virtskb_send(struct virtskb *vs, struct sk_buff *skb)" with a part of the code
of xmit_skb().

Let me know if you have in mind better names or if I should put these function
in another place.

I would like to leave the control part completely separate, so, for example,
the two drivers will negotiate the features independently and they will call
the right virtskb_receive_*() function based on the negotiation.

I already started to work on it, but before to do more steps and send an RFC
patch, I would like to hear your opinion.
Do you think that makes sense?
Do you see any issue or a better solution?

Thanks in advance,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
