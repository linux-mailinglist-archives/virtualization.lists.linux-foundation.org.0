Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D232AC7C
	for <lists.virtualization@lfdr.de>; Tue,  2 Mar 2021 23:25:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1F1C60705;
	Tue,  2 Mar 2021 22:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWixoLGTRhDd; Tue,  2 Mar 2021 22:25:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1E5F6074C;
	Tue,  2 Mar 2021 22:25:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65FCFC0001;
	Tue,  2 Mar 2021 22:25:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50FB5C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 22:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 370F9431E9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 22:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ohVxf7q-mjT
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 22:25:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76BB2431AE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 22:25:46 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D234A64F1D;
 Tue,  2 Mar 2021 22:25:43 +0000 (UTC)
Date: Tue, 2 Mar 2021 17:25:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v5 19/19] virtio/vsock: update trace event for
 SEQPACKET
Message-ID: <20210302172542.605b3795@gandalf.local.home>
In-Reply-To: <20210218054219.1069224-1-arseny.krasnov@kaspersky.com>
References: <20210218053347.1066159-1-arseny.krasnov@kaspersky.com>
 <20210218054219.1069224-1-arseny.krasnov@kaspersky.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andra Paraschiv <andraprs@amazon.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, stsp2@yandex.ru,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 oxffffaa@gmail.com, Ingo Molnar <mingo@redhat.com>,
 Norbert Slusarek <nslusarek@gmx.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Thu, 18 Feb 2021 08:42:15 +0300
Arseny Krasnov <arseny.krasnov@kaspersky.com> wrote:

Not sure if this was pulled in yet, but I do have a small issue with this
patch.

> @@ -69,14 +82,19 @@ TRACE_EVENT(virtio_transport_alloc_pkt,
>  		__entry->type = type;
>  		__entry->op = op;
>  		__entry->flags = flags;
> +		__entry->msg_len = msg_len;
> +		__entry->msg_cnt = msg_cnt;
>  	),
> -	TP_printk("%u:%u -> %u:%u len=%u type=%s op=%s flags=%#x",
> +	TP_printk("%u:%u -> %u:%u len=%u type=%s op=%s flags=%#x "
> +		  "msg_len=%u msg_cnt=%u",

It's considered poor formatting to split strings like the above. This is
one of the exceptions for the 80 character limit. Do not break strings just
to keep it within 80 characters.

-- Steve


>  		  __entry->src_cid, __entry->src_port,
>  		  __entry->dst_cid, __entry->dst_port,
>  		  __entry->len,
>  		  show_type(__entry->type),
>  		  show_op(__entry->op),
> -		  __entry->flags)
> +		  __entry->flags,
> +		  __entry->msg_len,
> +		  __entry->msg_cnt)
>  );
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
