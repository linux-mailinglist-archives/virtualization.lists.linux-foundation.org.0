Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C815C16B03F
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 20:28:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 235372051A;
	Mon, 24 Feb 2020 19:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AvIlf50LOTDd; Mon, 24 Feb 2020 19:28:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 394F42051E;
	Mon, 24 Feb 2020 19:28:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09497C0177;
	Mon, 24 Feb 2020 19:28:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46D29C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 19:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3575E85DA0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 19:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zs7bq8xoHfUr
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 19:28:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
 [209.85.161.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5800C85D5C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 19:28:23 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id i126so5745270ywe.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 11:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pQ/Mv1lsK35PGwG/+EQQAX4t9NIVJij/qvcmgkXlig0=;
 b=cPXMnH/CWqMNUZqfPD0rS6L9xlDNK0R07aS//51rLjkkM+TpdkJlYWJFDr+CFjNkNE
 Bhljkrch4wHeufoFrhbeG4+ghD5xhgGHnrkss+hP85z2Xv3mm5Dnm/eVO2OqOz+GNadJ
 a5dzlBqwhy8XeQ79gY2dwlbbGtR2QegDex11kpJ28betp2YxH6vkx8haV3GYchOX0TuX
 fvqaX/aVqQii0jW2an9k0ZUBrLTi97/eQf0z30yjQKSISdJ9Fs5icr8Wwp2InVsTSjA+
 EvNAPijegjWiJ4tJ+Izxdep4iTJa9mwNqwcYEy56ZYqs3XtooY1J1Y0CTGe0vXqgavNZ
 5/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pQ/Mv1lsK35PGwG/+EQQAX4t9NIVJij/qvcmgkXlig0=;
 b=YXjCFCjXl7DdxnH51TeWTTMo3+swmye9iyeLJNQ/puYoXGeqJhbl53P7OJYKuoIo4x
 m9q+hp1QyR8vwkkL84m8q9k4fC2hY8GPB98RVuoQSWNA+qenFbf2fCipXA9NWNwl9IC3
 lfDMYL2UkQs8UcUGk6eo4bsMoxMqg1qLCyfKjJUr9RgNuJ0xX6U9rnty8H4TwP1JbEwy
 z/XAqne0DswnNkvqa88zIcxfifdkzcAg0TPppJozkiz7hQ3CvhcCd9tzGLrAWmWgwh8q
 eigkbaI9aHfI3BNFK/mocrrMIk6CMUG39eX2pdAGWx19VAakqHP4R9sZs0qVDpXtT1+y
 Qoqw==
X-Gm-Message-State: APjAAAV78A7CjZc4d2UdpQ0oCSOHQlqqT6w62IapBw9szMdDTi+aSVEa
 TKZ+d1pA+yQzGRcozPQLnF30aIYt
X-Google-Smtp-Source: APXvYqxYyug4nRItJbnXAEBkmPvKAYc1we2WrPndxqK0b1jefu0njzEIx+XOg4jqgbQvlccMW9OZ+Q==
X-Received: by 2002:a0d:cbc7:: with SMTP id
 n190mr41381720ywd.133.1582572501479; 
 Mon, 24 Feb 2020 11:28:21 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180])
 by smtp.gmail.com with ESMTPSA id y129sm5361741ywd.40.2020.02.24.11.28.20
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 11:28:20 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id u26so5185952ybd.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 11:28:20 -0800 (PST)
X-Received: by 2002:a25:cc8a:: with SMTP id l132mr8632212ybf.178.1582572499831; 
 Mon, 24 Feb 2020 11:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20200224132550.2083-1-anton.ivanov@cambridgegreys.com>
In-Reply-To: <20200224132550.2083-1-anton.ivanov@cambridgegreys.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 24 Feb 2020 14:27:42 -0500
X-Gmail-Original-Message-ID: <CA+FuTSd8P6uQnwisZEh7+nfowW9qKLBEvA4GPg+xUkjBa-6TDA@mail.gmail.com>
Message-ID: <CA+FuTSd8P6uQnwisZEh7+nfowW9qKLBEvA4GPg+xUkjBa-6TDA@mail.gmail.com>
Subject: Re: [PATCH v3] virtio: Work around frames incorrectly marked as gso
To: anton.ivanov@cambridgegreys.com
Cc: Eric Dumazet <eric.dumazet@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Network Development <netdev@vger.kernel.org>, linux-um@lists.infradead.org,
 virtualization@lists.linux-foundation.org
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

On Mon, Feb 24, 2020 at 8:26 AM <anton.ivanov@cambridgegreys.com> wrote:
>
> From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
>
> Some of the locally generated frames marked as GSO which
> arrive at virtio_net_hdr_from_skb() have no GSO_TYPE, no
> fragments (data_len = 0) and length significantly shorter
> than the MTU (752 in my experiments).

Do we understand how these packets are generated? Else it seems this
might be papering over a deeper problem.

The stack should not create GSO packets less than or equal to
skb_shinfo(skb)->gso_size. See for instance the check in
tcp_gso_segment after pulling the tcp header:

        mss = skb_shinfo(skb)->gso_size;
        if (unlikely(skb->len <= mss))
                goto out;

What is the gso_type, and does it include SKB_GSO_DODGY?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
