Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA4773471C
	for <lists.virtualization@lfdr.de>; Sun, 18 Jun 2023 18:54:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBED2607BC;
	Sun, 18 Jun 2023 16:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBED2607BC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rY8QSvEl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4ySySyPbbDv; Sun, 18 Jun 2023 16:54:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7FCC760AAA;
	Sun, 18 Jun 2023 16:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FCC760AAA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4CB6C008C;
	Sun, 18 Jun 2023 16:54:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 707A8C0029
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Jun 2023 16:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36028410B7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Jun 2023 16:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36028410B7
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rY8QSvEl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RLh_PKxADPa8
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Jun 2023 16:54:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C467405C7
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C467405C7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Jun 2023 16:54:42 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-62fd844ad58so20461266d6.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 18 Jun 2023 09:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687107281; x=1689699281;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4sK61SVjYCcgummf/cy7pNsLb9SbPBeqU0f1FYDFMyI=;
 b=rY8QSvEl6p4fIeB+cNXrfBx3Qi8Q0oRZm5VoS2BoCgfjuYRQQUwrdFGEDdU23IrXo0
 chGoGHKPwP0LXmrfTl3qHlcCmo1sRYapzINEnQSow+fzi+pFn5PGiApYOrJ50HKaB68T
 utE+yg2GnzRQ30Bj8a8L69p3c374+UtcDkNfJR34GIn05f0b7+0AmEbyApvKm1DNJWT/
 bJcRj7sz29ir/3TzVW+gzb/qTkz7VnAPSgi9enEEZ3+K74hSxYqhdeSEvqiAsjKKoCqT
 OzoP6N5BMK7b0x2JfdgrfrTiD4DoK57jW0lPFco02d1KYyD6s/pMa/qc2P6IX40592qx
 JtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687107281; x=1689699281;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4sK61SVjYCcgummf/cy7pNsLb9SbPBeqU0f1FYDFMyI=;
 b=NpIyEhGSgAiKZlvEN/1lwDzPjTDhciCVlG+OBZ1HQE6d2b5BWamdEn/r7KdHn5YF/a
 T8QiEWbAb1Bwhuz1C63hLuCrZnhJn5BpD7fvaDEwpa7RYsopvM/HTjtKz3WffgyqrLp+
 YO13cp1czt3EG9PUuQwl0dJJipUJ1Tz4m2h9gIlxDXieuRHThGLRvoHw1OEVJ3z+fbg2
 nGMAAvKE7DnglFf8TXK7QrZbvoWDDcuOasRxhWPWkwBfLdtQ1WghGlL1/LOS/wgyRa0g
 MF1VM6gy+xvraapJV8VV4DrH9drVCaZLxYN0w9U5wbB7ks30Cc7myqAEFpx7FQY/dd8D
 +i1Q==
X-Gm-Message-State: AC+VfDy31wbdu4jqR146AV1IKYaryDSYj+Ms743H6BtdHfVkYmr91vWh
 it4JV0YuMLGBAdOVVKRIyx8=
X-Google-Smtp-Source: ACHHUZ7rD2n8b5vnYB/xOzS5BAQNWYuxXJrQo4BmBND6gWZP6jCAnPQahStFSM7LauZ1ZKr4AefxaQ==
X-Received: by 2002:ad4:5be2:0:b0:626:33bb:3fd3 with SMTP id
 k2-20020ad45be2000000b0062633bb3fd3mr8290593qvc.19.1687107280821; 
 Sun, 18 Jun 2023 09:54:40 -0700 (PDT)
Received: from localhost (172.174.245.35.bc.googleusercontent.com.
 [35.245.174.172]) by smtp.gmail.com with ESMTPSA id
 t3-20020ac85303000000b003f7a54fa72fsm1857340qtn.0.2023.06.18.09.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jun 2023 09:54:40 -0700 (PDT)
Date: Sun, 18 Jun 2023 12:54:40 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: David Howells <dhowells@redhat.com>, 
 netdev@vger.kernel.org
Message-ID: <648f36d02fe6e_33cfbc2944f@willemb.c.googlers.com.notmuch>
In-Reply-To: <20230617121146.716077-18-dhowells@redhat.com>
References: <20230617121146.716077-1-dhowells@redhat.com>
 <20230617121146.716077-18-dhowells@redhat.com>
Subject: RE: [PATCH net-next v2 17/17] net: Kill MSG_SENDPAGE_NOTLAST
Mime-Version: 1.0
Cc: linux-doc@vger.kernel.org, Alexander Duyck <alexander.duyck@gmail.com>,
 virtualization@lists.linux-foundation.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 linux-afs@lists.infradead.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, linux-x25@vger.kernel.org,
 dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org,
 rds-devel@oss.oracle.com, linux-can@vger.kernel.org,
 linux-hams@vger.kernel.org, mptcp@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, David Ahern <dsahern@kernel.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-sctp@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, bpf@vger.kernel.org, linux-wpan@vger.kernel.org,
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

David Howells wrote:
> Now that ->sendpage() has been removed, MSG_SENDPAGE_NOTLAST can be cleaned
> up.  Things were converted to use MSG_MORE instead, but the protocol
> sendpage stubs still convert MSG_SENDPAGE_NOTLAST to MSG_MORE, which is now
> unnecessary.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: "David S. Miller" <davem@davemloft.net>
> cc: Eric Dumazet <edumazet@google.com>
> cc: Jakub Kicinski <kuba@kernel.org>
> cc: Paolo Abeni <pabeni@redhat.com>
> cc: Jens Axboe <axboe@kernel.dk>
> cc: Matthew Wilcox <willy@infradead.org>
> cc: bpf@vger.kernel.org
> cc: dccp@vger.kernel.org
> cc: linux-afs@lists.infradead.org
> cc: linux-arm-msm@vger.kernel.org
> cc: linux-can@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> cc: linux-doc@vger.kernel.org
> cc: linux-hams@vger.kernel.org
> cc: linux-perf-users@vger.kernel.org
> cc: linux-rdma@vger.kernel.org
> cc: linux-sctp@vger.kernel.org
> cc: linux-wpan@vger.kernel.org
> cc: linux-x25@vger.kernel.org
> cc: mptcp@lists.linux.dev
> cc: netdev@vger.kernel.org
> cc: rds-devel@oss.oracle.com
> cc: tipc-discussion@lists.sourceforge.net
> cc: virtualization@lists.linux-foundation.org
> ---
>  include/linux/socket.h                         | 4 +---
>  net/ipv4/tcp_bpf.c                             | 4 +++-
>  net/tls/tls_device.c                           | 3 +--
>  net/tls/tls_main.c                             | 2 +-
>  net/tls/tls_sw.c                               | 2 +-
>  tools/perf/trace/beauty/include/linux/socket.h | 1 -
>  tools/perf/trace/beauty/msg_flags.c            | 3 ---
>  7 files changed, 7 insertions(+), 12 deletions(-)
>
 
> @@ -90,7 +90,9 @@ static int tcp_bpf_push(struct sock *sk, struct sk_msg *msg, u32 apply_bytes,
>  {
>  	bool apply = apply_bytes;
>  	struct scatterlist *sge;
> -	struct msghdr msghdr = { .msg_flags = flags | MSG_SPLICE_PAGES, };
> +	struct msghdr msghdr = {
> +		.msg_flags = flags | MSG_SPLICE_PAGES | MSG_MORE,
> +	};
>  	struct page *page;
>  	int size, ret = 0;
>  	u32 off;

Is it intentional to add MSG_MORE here in this patch?

I do see that patch 3 removes this branch:

@@ -111,9 +111,6 @@  static int tcp_bpf_push(struct sock *sk, struct sk_msg *msg, u32 apply_bytes,
 		if (has_tx_ulp)
 			msghdr.msg_flags |= MSG_SENDPAGE_NOPOLICY;
 
-		if (flags & MSG_SENDPAGE_NOTLAST)
-			msghdr.msg_flags |= MSG_MORE;
-
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
