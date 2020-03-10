Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DD245180B21
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 23:03:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8870A2156B;
	Tue, 10 Mar 2020 22:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zsfF53fDdHiq; Tue, 10 Mar 2020 22:03:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 812082154C;
	Tue, 10 Mar 2020 22:03:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E1B0C0177;
	Tue, 10 Mar 2020 22:03:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B04CC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 22:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8195F88A81
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 22:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 44+z11QYa+if
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 22:03:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8D4DB8872C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 22:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583877783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=em5WQq5ac7V0TSXaeHIBQxjAvzn15Y90KasLTGrg4SM=;
 b=avlm0Oe85BjZfZfEOZlIxeDhfWSqMvmqfYSfBkC9hoxY4Z/MBJarNQa5c6nYyLhYWsX39F
 MB2QbENCG2PzNa7CN38uIpHgFEYg6z1WWX4abJfp/dbnPKSYTk1uN26AOZA1ysILHCa5rw
 7Y4VzJeN1sQLLJkJ6PcSpFpCkXGDXLM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-eGsx44o9PvuVWjm-9xdTWQ-1; Tue, 10 Mar 2020 18:03:01 -0400
X-MC-Unique: eGsx44o9PvuVWjm-9xdTWQ-1
Received: by mail-wr1-f70.google.com with SMTP id v6so4965106wrg.22
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 15:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=40W/kfQFw5xqXbXKZGwOTmPRgRjffptCSgf0Kp+g8OA=;
 b=YBjixBgyjwMLTNue9QkOGC9gFDctJfiA2F0uwKOGKFu7HtuuXKTebzmdu2hgIkSM2G
 ODJujA8CcG9QpxN7N6jk8YyBH+AfeEp2gIbNW2Qb9k1S14vzskJ6Q8VpiMkcJxpU6nDw
 r+dkPoQw4C0ophB1PcPk7/E8XWG9GCDcmzDR6aLkJ8e7f0Zkvr1YTRnLIFtrVK4KDxLg
 cYuVjX5LeXITaTcU4zcJMUtJo0aQ7/8gDmbv2Xb+mkJIbTpcTBTWmvCVhYDOWbGUDLy3
 f51si6C3jkhauvPCx/qsyna1x/sZa80KFC9f7WtQYpghnP4mf6YVugs3fEp7OdSQraf1
 3Hyw==
X-Gm-Message-State: ANhLgQ07h80AcFdOS8MgRm5EZ29rFVjQCowaHBi6QHuUy4OI8p4tkUTJ
 aftxrNtG3Ocr8MuPM7r8Q2Qn6fUJjHo0d3X/sb3B/qyW/jxhGonE4glknZc+q1PF8bB43HxhSCu
 iaahY66N98PlTvEWFG2yoNaZviyIVaVXhrJ3nYb2L6w==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr15891896wrq.129.1583877780643; 
 Tue, 10 Mar 2020 15:03:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtZW/8L6Ll/FpuR0abFGldY17cpkX73JNYI1cBMm+URNiyq/qfzVgh4k4hvqu/EPs8sL15bng==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr15891878wrq.129.1583877780451; 
 Tue, 10 Mar 2020 15:03:00 -0700 (PDT)
Received: from [192.168.3.122] (p5B0C6338.dip0.t-ipconnect.de. [91.12.99.56])
 by smtp.gmail.com with ESMTPSA id
 u25sm5672417wml.17.2020.03.10.15.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 15:02:59 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Date: Tue, 10 Mar 2020 23:02:58 +0100
Message-Id: <6021D755-F883-4524-B3D1-07C03C7DF11B@redhat.com>
References: <20200310172114-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200310172114-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: iPhone Mail (17D50)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Tyler Sanderson <tysand@google.com>,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Cgo+IEFtIDEwLjAzLjIwMjAgdW0gMjI6MjUgc2NocmllYiBNaWNoYWVsIFMuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPjoKPiAKPiDvu79PbiBUdWUsIE1hciAxMCwgMjAyMCBhdCAwODoxMzoxOVBN
ICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+IFNob3VsZCB0aGlzIGhhdmU6Cj4+
PiAKPj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgNC4xOSsKPj4gCj4+IEkgZ3Vlc3Mg
YXMgbm90aGluZyB3aWxsIGFjdHVhbGx5ICJjcmFzaCIgaXQncyBub3Qgd29ydGggc3RhYmxlLgo+
IAo+IAo+IE5vIC0gaXQncyBhIHJlZ3Jlc3Npb24sIGl0IHdvdWxkIGJlIGEgc3RhYmxlIGNhbmRp
ZGF0ZSBmcm9tIHRoYXQgUE9WLgoKQUZBSUsKCuKAniBJdCBtdXN0IGZpeCBhIHByb2JsZW0gdGhh
dCBjYXVzZXMgYSBidWlsZCBlcnJvciAoYnV0IG5vdCBmb3IgdGhpbmdzIG1hcmtlZCBDT05GSUdf
QlJPS0VOKSwgYW4gb29wcywgYSBoYW5nLCBkYXRhIGNvcnJ1cHRpb24sIGEgcmVhbCBzZWN1cml0
eSBpc3N1ZSwgb3Igc29tZSDigJxvaCwgdGhhdOKAmXMgbm90IGdvb2TigJ0gaXNzdWUuIEluIHNo
b3J0LCBzb21ldGhpbmcgY3JpdGljYWwu4oCcCgpJZiB0aGlzIHJlZ3Jlc3Npb24gaXMgdGhhdCBj
cml0aWNhbCBpcyBkZWJhdGFibGUuIEJ1dCBpdCBkb2VzbuKAmHQgbWF0dGVyIGFzIHlvdSBjb3Jy
ZWN0bHkgc2F5LCBpdOKAmHMgdG9vIGJpZyA6KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
