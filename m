Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D9286735664
	for <lists.virtualization@lfdr.de>; Mon, 19 Jun 2023 14:05:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E4BC81F89;
	Mon, 19 Jun 2023 12:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E4BC81F89
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hnUetV29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08ZmP0FJS-a4; Mon, 19 Jun 2023 12:05:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1D70781F8C;
	Mon, 19 Jun 2023 12:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D70781F8C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68685C0089;
	Mon, 19 Jun 2023 12:05:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF63EC0029
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jun 2023 12:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A07760760
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jun 2023 12:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A07760760
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hnUetV29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPDeE6jRd7XO
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jun 2023 12:05:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59906606B0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59906606B0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jun 2023 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687176342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flv0m9IzvhIUpKnDIyrInh56vnSxXK9hbzXv0isFig8=;
 b=hnUetV29Dp1W/zpW3Yl5j5V1qiOL0PuvKfWbjW+/Y45dheY3YfE6x8eHoT5F07QrrWvRzQ
 DaXdCLnO8Xwe9tvzxtXtpL9O0n4sLRvf/sqR1KkR/qQea5tAFRpiDS2oUKIznpFUcPs5Og
 nWTlCXczkf/fPF88j/9jiSNVeRUj9TA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-6kJ1RmfDPwCBOHGN8dJYCQ-1; Mon, 19 Jun 2023 08:05:40 -0400
X-MC-Unique: 6kJ1RmfDPwCBOHGN8dJYCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FC9A1C06EC1;
 Mon, 19 Jun 2023 12:05:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88C75C1603B;
 Mon, 19 Jun 2023 12:05:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <648f36d02fe6e_33cfbc2944f@willemb.c.googlers.com.notmuch>
References: <648f36d02fe6e_33cfbc2944f@willemb.c.googlers.com.notmuch>
 <20230617121146.716077-1-dhowells@redhat.com>
 <20230617121146.716077-18-dhowells@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next v2 17/17] net: Kill MSG_SENDPAGE_NOTLAST
MIME-Version: 1.0
Content-ID: <784657.1687176327.1@warthog.procyon.org.uk>
Date: Mon, 19 Jun 2023 13:05:27 +0100
Message-ID: <784658.1687176327@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Cc: linux-doc@vger.kernel.org, Alexander Duyck <alexander.duyck@gmail.com>,
 virtualization@lists.linux-foundation.org, dhowells@redhat.com,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 linux-afs@lists.infradead.org, rds-devel@oss.oracle.com,
 linux-x25@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-hams@vger.kernel.org, mptcp@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-sctp@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 bpf@vger.kernel.org, linux-wpan@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
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

Willem de Bruijn <willemdebruijn.kernel@gmail.com> wrote:

> Is it intentional to add MSG_MORE here in this patch?
> 
> I do see that patch 3 removes this branch:

Yeah.  I think I may have tcp_bpf a bit wrong with regard to handling
MSG_MORE.

How about the attached version of tcp_bpf_push()?

I wonder if it's save to move the setting of MSG_SENDPAGE_NOPOLICY out of the
loop as I've done here.  The caller holds the socket lock.

Also, I'm not sure whether to take account of apply/apply_bytes when setting
MSG_MORE mid-message, or whether to just go on whether we've reached
sge->length yet.  (I'm not sure exactly how tcp_bpf works).

David
---

static int tcp_bpf_push(struct sock *sk, struct sk_msg *msg, u32 apply_bytes,
			int flags, bool uncharge)
{
	bool apply = apply_bytes;
	struct scatterlist *sge;
	struct page *page;
	int size, ret = 0;
	u32 off;

	flags |= MSG_SPLICE_PAGES;
	if (tls_sw_has_ctx_tx(sk))
		msghdr.msg_flags |= MSG_SENDPAGE_NOPOLICY;

	while (1) {
		struct msghdr msghdr = {};
		struct bio_vec bvec;

		sge = sk_msg_elem(msg, msg->sg.start);
		size = (apply && apply_bytes < sge->length) ?
			apply_bytes : sge->length;
		off  = sge->offset;
		page = sg_page(sge);

		tcp_rate_check_app_limited(sk);
retry:
		msghdr.msg_flags = flags;

		/* Determine if we need to set MSG_MORE. */
		if (!(msghdr.msg_flags & MSG_MORE)) {
			if (apply && size < apply_bytes)
				msghdr.msg_flags |= MSG_MORE;
			else if (!apply && size < sge->length &&
				 msg->sg.start != msg->sg.end)
				msghdr.msg_flags |= MSG_MORE;
		}

		bvec_set_page(&bvec, page, size, off);
		iov_iter_bvec(&msghdr.msg_iter, ITER_SOURCE, &bvec, 1, size);
		ret = tcp_sendmsg_locked(sk, &msghdr, size);
		if (ret <= 0)
			return ret;

		if (apply)
			apply_bytes -= ret;
		msg->sg.size -= ret;
		sge->offset += ret;
		sge->length -= ret;
		if (uncharge)
			sk_mem_uncharge(sk, ret);
		if (ret != size) {
			size -= ret;
			off  += ret;
			goto retry;
		}
		if (!sge->length) {
			put_page(page);
			sk_msg_iter_next(msg, start);
			sg_init_table(sge, 1);
			if (msg->sg.start == msg->sg.end)
				break;
		}
		if (apply && !apply_bytes)
			break;
	}

	return 0;
}

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
