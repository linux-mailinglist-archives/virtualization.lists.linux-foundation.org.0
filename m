Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC9614260E
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 09:45:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6AFE120403;
	Mon, 20 Jan 2020 08:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNNtFapxuRHU; Mon, 20 Jan 2020 08:45:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AF017203A4;
	Mon, 20 Jan 2020 08:45:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97571C0174;
	Mon, 20 Jan 2020 08:45:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5007DC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3D80584C53
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4y-lkDsjKXN
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:44:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8873A811ED
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579509897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sl9pGanJyd/CB0uhWh/CfWGutDsL/HyC3562Uwp1M9s=;
 b=T+MeGL1Ve80ggPr4HyzlsnilzcrRie5oW5/9TswKROvXbYw6eYmROYB4TQcdGlM453J3Hi
 fjzQaEnyFqgZyLJj2cF9K8hr7+mpGhQm8AjSyjEDkSIyg7o0JdJ5YWLjRnBirlc81YKfd7
 PLuDbyQWCFupeQAuxHPn4/2qR7WU8FA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-4Cog00rCO-GKLV2WFtukmw-1; Mon, 20 Jan 2020 03:44:54 -0500
X-MC-Unique: 4Cog00rCO-GKLV2WFtukmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 296C1DBA5;
 Mon, 20 Jan 2020 08:44:52 +0000 (UTC)
Received: from [10.72.12.173] (ovpn-12-173.pek2.redhat.com [10.72.12.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0FF810016E8;
 Mon, 20 Jan 2020 08:44:35 +0000 (UTC)
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
To: "Michael S. Tsirkin" <mst@redhat.com>, Shahaf Shuler <shahafs@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <20200119045849-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d4e7fc56-c9d8-f01f-1504-dd49d5658037@redhat.com>
Date: Mon, 20 Jan 2020 16:44:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200119045849-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>, Netdev <netdev@vger.kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvMS8xOSDkuIvljYg1OjU5LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
U3VuLCBKYW4gMTksIDIwMjAgYXQgMDk6MDc6MDlBTSArMDAwMCwgU2hhaGFmIFNodWxlciB3cm90
ZToKPj4+IFRlY2huaWNhbGx5LCB3ZSBjYW4ga2VlcCB0aGUgaW5jcmVtZW50YWwgQVBJCj4+PiBo
ZXJlIGFuZCBsZXQgdGhlIHZlbmRvciB2RFBBIGRyaXZlcnMgdG8gcmVjb3JkIHRoZSBmdWxsIG1h
cHBpbmcKPj4+IGludGVybmFsbHkgd2hpY2ggbWF5IHNsaWdodGx5IGluY3JlYXNlIHRoZSBjb21w
bGV4aXR5IG9mIHZlbmRvciBkcml2ZXIuCj4+IFdoYXQgd2lsbCBiZSB0aGUgdHJpZ2dlciBmb3Ig
dGhlIGRyaXZlciB0byBrbm93IGl0IHJlY2VpdmVkIHRoZSBsYXN0IG1hcHBpbmcgb24gdGhpcyBz
ZXJpZXMgYW5kIGl0IGNhbiBub3cgcHVzaCBpdCB0byB0aGUgb24tY2hpcCBJT01NVT8KPiBTb21l
IGtpbmQgb2YgaW52YWxpZGF0ZSBBUEk/Cj4KClRoZSBwcm9ibGVtIGlzIGhvdyB0byBkZWFsIHdp
dGggdGhlIGNhc2Ugb2YgdklPTU1VLiBXaGVuIHZJT01NVSBpcyAKZW5hYmxpbmcgdGhlcmUncyBu
byBjb25jZXB0IG9mIGxhc3QgbWFwcGluZy4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
