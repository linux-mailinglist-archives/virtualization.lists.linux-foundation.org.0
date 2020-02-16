Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B977160258
	for <lists.virtualization@lfdr.de>; Sun, 16 Feb 2020 08:36:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 06827863E1;
	Sun, 16 Feb 2020 07:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rz6WezUA46pL; Sun, 16 Feb 2020 07:36:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E2068609D;
	Sun, 16 Feb 2020 07:36:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FB83C0177;
	Sun, 16 Feb 2020 07:36:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D484C0177
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 63E438609D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prKFCqGAmZ0C
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:36:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 828ED8608D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581838610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4bNaF/Khk/K3TQWbK8bP2zjniSSeyEiuOxI6++XNPO0=;
 b=MnOn1Uf47OaD0vgJa0OIKfREO48Jm3OoBMAMQpRxXLtDREcrMrwPJ+imVSj74frW5QvXs9
 SX5hMo808a304w7LjbgPtMP46zmJFgmbYVyqd7J8JFQQIFiVM5ODbnhyaBurk2llzjCEd4
 i3LZ49mMA/Sq7INjDpu9Xc6RXmwc/AQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-SMVxSyYJNzytPuQvwANguA-1; Sun, 16 Feb 2020 02:36:49 -0500
Received: by mail-wr1-f70.google.com with SMTP id j4so6925448wrs.13
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 23:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=O2JW1kkAAj7rNrgatlYafFmGug2dLIWpAOPCneb1jWc=;
 b=dzRtkhZmMbUgyUhVayyxxa0EVu9sFVmwUJMDOg6prrYFnaina+CVLZgn2so8BHSRQI
 3xPMQd4z37TgaDxCHsMH++iAibutlrEQCJgvBBun/fQqLuF1pTYj1X5xWoPw48B/SMFA
 zGa2HZZ+g2SKXR+YEVdgrXNO/MpC9api4ydY10T9afx567FvgdjGdNiA2B0j/gpEa+9E
 3XFbzcXqJjzPd1l7bBIXwnIJJ6uH6lEpgPT/h3jBfMzeRTyKcunqzJjv5okuCiNSYkEz
 o3sjmg+zZwBBJBfZcOrnNiBsrNis9z4CSbLmqen1bkgDikDB2MwoTLi4dRpv6PfozOjb
 ytFQ==
X-Gm-Message-State: APjAAAVfn/lG60xfTumq/MSXG40oR0XR0I1XcLMb221JIGg1nW0jnxec
 Cf+OWPTeMv8TBrJtkYfkfpwk2wHgwfBoV/Nc+qgkjQMCYgY10DAV6E8RoeW8cLU89bKKGPJpMKj
 HQLgieq0jFw65/BDtcEibVrtXQPOT+1TI+axjD7jStg==
X-Received: by 2002:a1c:b08a:: with SMTP id z132mr15686479wme.73.1581838607885; 
 Sat, 15 Feb 2020 23:36:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwlyujzDZ5ard0PHULJI4K66sEcjNncPLWa49mWHbxgOEqnlABkfamJnR4+kBjUWIyC0K1XMg==
X-Received: by 2002:a1c:b08a:: with SMTP id z132mr15686445wme.73.1581838607531; 
 Sat, 15 Feb 2020 23:36:47 -0800 (PST)
Received: from [192.168.3.122] (p5B0C616F.dip0.t-ipconnect.de. [91.12.97.111])
 by smtp.gmail.com with ESMTPSA id
 e22sm15636901wme.45.2020.02.15.23.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2020 23:36:47 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] virtio_balloon: Adjust label in virtballoon_probe
Date: Sun, 16 Feb 2020 08:36:45 +0100
Message-Id: <67FCAE69-05CF-4588-A7BC-664267D14BAF@redhat.com>
References: <20200216004039.23464-1-natechancellor@gmail.com>
In-Reply-To: <20200216004039.23464-1-natechancellor@gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailer: iPhone Mail (17D50)
X-MC-Unique: SMVxSyYJNzytPuQvwANguA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, clang-built-linux@googlegroups.com
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

Cgo+IEFtIDE2LjAyLjIwMjAgdW0gMDE6NDEgc2NocmllYiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
ZWNoYW5jZWxsb3JAZ21haWwuY29tPjoKPiAKPiDvu79DbGFuZyB3YXJucyB3aGVuIENPTkZJR19C
QUxMT09OX0NPTVBBQ1RJT04gaXMgdW5zZXQ6Cj4gCj4gLi4vZHJpdmVycy92aXJ0aW8vdmlydGlv
X2JhbGxvb24uYzo5NjM6MTogd2FybmluZzogdW51c2VkIGxhYmVsCj4gJ291dF9kZWxfdnFzJyBb
LVd1bnVzZWQtbGFiZWxdCj4gb3V0X2RlbF92cXM6Cj4gXn5+fn5+fn5+fn5+Cj4gMSB3YXJuaW5n
IGdlbmVyYXRlZC4KPiAKClRoYW5rcywgdGhlcmUgaXMgYWxyZWFkeSDigJ4gW1BBVENIXSB2aXJ0
aW9fYmFsbG9vbjogRml4IHVudXNlZCBsYWJlbCB3YXJuaW5n4oCcIGZyb20gQm9yaXMgb24gdGhl
IGxpc3QuCgpDaGVlcnMhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
