Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 760CD290622
	for <lists.virtualization@lfdr.de>; Fri, 16 Oct 2020 15:17:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 302AE88C86;
	Fri, 16 Oct 2020 13:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ny2FB0pB8dfr; Fri, 16 Oct 2020 13:17:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 51DE888C89;
	Fri, 16 Oct 2020 13:17:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30DBAC0051;
	Fri, 16 Oct 2020 13:17:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84FB8C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Oct 2020 13:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8124988C85
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Oct 2020 13:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yJ-PLxgaVzO1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Oct 2020 13:17:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A544B88C7F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Oct 2020 13:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602854235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppwECXXF9N8LusanMZ3Ph7brQG4uWGwjqD3v/E6A81c=;
 b=i/4oaWTlVyul+2reJLE8q1VS2iR0ZeOZ454DNyDhq24AqyMdgKVYhFVsDpqTnlleMiHbMx
 uvBas8Zt2GXvosXbzTHr83LUtDguhKOO0xI3cmWdS5IRpvDHJIqu9Jb4k+n/SnSms2uv+Q
 H5/RrWioh+ALOvm1Hf7+MRqwIrHd3IE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-vJtuXK49Osm8WkYjnAPuUw-1; Fri, 16 Oct 2020 09:17:13 -0400
X-MC-Unique: vJtuXK49Osm8WkYjnAPuUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0F008014D8;
 Fri, 16 Oct 2020 13:17:11 +0000 (UTC)
Received: from [10.36.113.23] (ovpn-113-23.ams2.redhat.com [10.36.113.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 480E95D9D5;
 Fri, 16 Oct 2020 13:17:07 +0000 (UTC)
Subject: Re: [PATCH v1 20/29] virtio-mem: nb_sb_per_mb and subblock_size are
 specific to Sub Block Mode (SBM)
To: Wei Yang <richard.weiyang@linux.alibaba.com>
References: <20201012125323.17509-1-david@redhat.com>
 <20201012125323.17509-21-david@redhat.com>
 <20201016085319.GD44269@L-31X9LVDL-1304.local>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <7b55ffe1-95fc-1e71-ea6b-82bd0a98a6b4@redhat.com>
Date: Fri, 16 Oct 2020 15:17:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016085319.GD44269@L-31X9LVDL-1304.local>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
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

On 16.10.20 10:53, Wei Yang wrote:
> On Mon, Oct 12, 2020 at 02:53:14PM +0200, David Hildenbrand wrote:
>> Let's rename to "sbs_per_mb" and "sb_size" and move accordingly.
>>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> One trivial suggestion, could we move this patch close the data structure
> movement patch?
> 
> I know this would be some work, since you have changed some of the code logic.
> This would take you some time to rebase.

You mean after patch #17 ?

I guess I can move patch #18 (prereq) a little further up (e.g., after
patch #15). Guess moving it in front of #19 shouldn't be too hard.

Will give it a try - if it takes too much effort, I'll leave it like this.

Thanks!

-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
