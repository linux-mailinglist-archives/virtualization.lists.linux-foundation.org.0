Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF339A4E8
	for <lists.virtualization@lfdr.de>; Thu,  3 Jun 2021 17:41:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EA31400FC;
	Thu,  3 Jun 2021 15:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcSZhsJqDUaj; Thu,  3 Jun 2021 15:41:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E0534054A;
	Thu,  3 Jun 2021 15:41:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C23B3C0024;
	Thu,  3 Jun 2021 15:41:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B50CC0001
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 15:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 614FE8414E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 15:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuaOxIdHlRao
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 15:41:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B141383C2C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622734865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AvsQH1hyQpvPjHL2hTxdfQHPQhfR4l9xQwXErWo9HxI=;
 b=BNg3EReHIs4hthXGljuhvnTa/oF8Uo9A4ODe2VS3CXGSaTwYbDLZvL9ExdshuTM78Wj/5J
 TKV+eHv41BDjH0Rh+8bJjM0ZANoN66p52KibZlepMwwMLyXpzCb8Fo/KGfLR9O3/LNKzaQ
 FluB1gMZX6dmIRSOFNACsb7gZWlXZ9A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-B1BRZX_AOj6C7TUTpXCyDQ-1; Thu, 03 Jun 2021 11:41:04 -0400
X-MC-Unique: B1BRZX_AOj6C7TUTpXCyDQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 hz18-20020a1709072cf2b02903fbaae9f4faso2105619ejc.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 03 Jun 2021 08:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AvsQH1hyQpvPjHL2hTxdfQHPQhfR4l9xQwXErWo9HxI=;
 b=p7x/GWTGO8+oivhPALVsG5pC4wdHgIJ6i72lYBX7cUjr+C6z0yK8WhFiZdTGyIepdL
 74RjroE5HvPhQr+W+ULsppbZTfYk5pELunE2IymZpi89/pRlkJnTtLM0jBGUM4+2ijDp
 gO9FVDpsEbK35FO8R4N09P6mr2gKoinVQjKZysfs6TQp4DQbZjG7kUd6rJ5lE6+NZwo2
 Xs9T5hPS27GUsDlpcliSOa1pbWtq58fT0LmZOJM6N/vPBuJXdPCy7fGEnvMRYh/deopI
 ahUJfl3jE1mVV9yxdWHbJ0lrsDSevvTxuSnsua+Nke1RQpCARXnnNIeHOY8AOWWTayqt
 dTjA==
X-Gm-Message-State: AOAM532u6JfZRnlT6f625HMD/wNR15QudyeKVyCia4nt8PmHY5UboFbf
 b4noMDuWWhoZ4uwWDndLbwiOLdvv0y/sy74gjs2zmATMQhzgx15YpD1+CTDGnzGBx9UEr27VwOj
 Y5aMmobBE4DCdaF6BnQOtmOMj/RwAo6f101kR8Q/b1w==
X-Received: by 2002:a05:6402:4313:: with SMTP id
 m19mr80408edc.263.1622734860914; 
 Thu, 03 Jun 2021 08:41:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY5YQ/utrtbJ0+zixQqmqhNKVQZErmThRj2KcDrDwxrmJQ2oZwOP9DefrKyZY+3MYgkheR+g==
X-Received: by 2002:a05:6402:4313:: with SMTP id
 m19mr80384edc.263.1622734860773; 
 Thu, 03 Jun 2021 08:41:00 -0700 (PDT)
Received: from steredhat ([5.170.129.82])
 by smtp.gmail.com with ESMTPSA id l8sm1930416edt.69.2021.06.03.08.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:41:00 -0700 (PDT)
Date: Thu, 3 Jun 2021 17:40:56 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [PATCH v10 18/18] virtio/vsock: update trace event for SEQPACKET
Message-ID: <20210603154056.e3zyk2wmmutq4nia@steredhat>
References: <20210520191357.1270473-1-arseny.krasnov@kaspersky.com>
 <20210520192008.1272910-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210520192008.1272910-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andra Paraschiv <andraprs@amazon.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 virtualization@lists.linux-foundation.org, oxffffaa@gmail.com,
 Ingo Molnar <mingo@redhat.com>, Norbert Slusarek <nslusarek@gmx.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, May 20, 2021 at 10:20:04PM +0300, Arseny Krasnov wrote:
>Add SEQPACKET socket type to vsock trace event.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> include/trace/events/vsock_virtio_transport_common.h | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/include/trace/events/vsock_virtio_transport_common.h b/include/trace/events/vsock_virtio_transport_common.h
>index 6782213778be..b30c0e319b0e 100644
>--- a/include/trace/events/vsock_virtio_transport_common.h
>+++ b/include/trace/events/vsock_virtio_transport_common.h
>@@ -9,9 +9,12 @@
> #include <linux/tracepoint.h>
>
> TRACE_DEFINE_ENUM(VIRTIO_VSOCK_TYPE_STREAM);
>+TRACE_DEFINE_ENUM(VIRTIO_VSOCK_TYPE_SEQPACKET);
>
> #define show_type(val) \
>-	__print_symbolic(val, { VIRTIO_VSOCK_TYPE_STREAM, "STREAM" })
>+	__print_symbolic(val, \
>+				{ VIRTIO_VSOCK_TYPE_STREAM, "STREAM" }, \
>+				{ VIRTIO_VSOCK_TYPE_SEQPACKET, "SEQPACKET" })

I think we should fixe the indentation here (e.g. following show_op):
  #define show_type(val) \
	__print_symbolic(val, \
			 { VIRTIO_VSOCK_TYPE_STREAM, "STREAM" }, \
			 { VIRTIO_VSOCK_TYPE_SEQPACKET, "SEQPACKET" })

Thanks,
Stefano

>
> TRACE_DEFINE_ENUM(VIRTIO_VSOCK_OP_INVALID);
> TRACE_DEFINE_ENUM(VIRTIO_VSOCK_OP_REQUEST);
>-- 
>2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
