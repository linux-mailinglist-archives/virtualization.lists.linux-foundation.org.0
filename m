Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9423B547263
	for <lists.virtualization@lfdr.de>; Sat, 11 Jun 2022 08:40:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDF5740104;
	Sat, 11 Jun 2022 06:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iDlcDdf8M-L; Sat, 11 Jun 2022 06:40:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6FF2C40520;
	Sat, 11 Jun 2022 06:40:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD379C0081;
	Sat, 11 Jun 2022 06:40:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CEC4C002D
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jun 2022 06:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0920160BAD
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jun 2022 06:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZtjumCeVoOv0
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jun 2022 06:40:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEDFC60B5B
 for <virtualization@lists.linux-foundation.org>;
 Sat, 11 Jun 2022 06:40:24 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id 15so1281503pfy.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jun 2022 23:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVqa3J7OGt1ju4WR6YBLni3wDLLiqBzSoMzIIn7mgLw=;
 b=bOJRmB/PYJGtcNQbp8EmFUGwv1OzgG3xq63krj0DuHsT992fA0B8qtK6Qv4pas9cQ0
 CVWrMfXrtEn3dNzDF2/kRbX7XvvjFoM8NxfdHmL6/F7WiGgUn13upeZO2UfPfkKEOJ7p
 yaPjjXd97z55dQao4NsXBlKloikK7AvBbGDHRYlKaxwdoS5+dh4QlvuTp6hKiHt8ObD8
 00+K6zk/IwS6kySvAX1tQ8NLvsfS+N6dq6RlkPnRsZCLXJtb7P/tir6Su54xd54z0zaF
 AVV0Jw7USrBVL/LPrcdunKdNfle4Z0EgSFmQJlxujYipLBJBclYzuvf7f25lcCl79Ntg
 29lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVqa3J7OGt1ju4WR6YBLni3wDLLiqBzSoMzIIn7mgLw=;
 b=C79EVqL6E5h56Ts+nuJZ4aO5xh26x7gp0l/hWRwSutrr+nwghOJL3Z69SoknOGBqJb
 gFpH9OaGc5nJDL/j6VZngEMk2dDW7BGhRHX+19zfy+bNLbkDA0dFY50o0x+t3AunP6ik
 PxB0tFIEWDkf3QWDJR1GoVJ3lPK8EVa4kIntVgxvZvwgwDFx7Dy6Vz90JG8Wq5xllTTB
 0z0MFWoQ7JdEJgGOdHnhXjQDaDXWNmulWF6NxvKASwaBQvjsKhNvviMq7T16bO4cloH8
 XYTXPWFdn6gN/O3CsAqZqkMXqInIshsqu7LcUzxCEceWG1vOVh4qEpETykfGAyU24xWn
 yA6w==
X-Gm-Message-State: AOAM532T39946MMyr1y6Zl3lPcLF4OvJuX9mL2PcMCL8xz26zOnR6xAy
 pUQ6roHcjcLRSH+W9O8TrEuYiw==
X-Google-Smtp-Source: ABdhPJwiFjXfZ6CagQFMXVNxXGECt/yZKJwzLX8gaXZ+QzL74hd+tbBoQ4cZT/NX6UMhVQ0WXl6nTw==
X-Received: by 2002:a63:409:0:b0:3fd:77f0:9a75 with SMTP id
 9-20020a630409000000b003fd77f09a75mr31514545pge.149.1654929623850; 
 Fri, 10 Jun 2022 23:40:23 -0700 (PDT)
Received: from always-T480.www.tendawifi.com ([139.177.225.235])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a170902ec9100b0016372486febsm762169plg.297.2022.06.10.23.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 23:40:23 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com
Subject: [PATCH v10 0/1] Introduce akcipher service for virtio-crypto
Date: Sat, 11 Jun 2022 14:42:42 +0800
Message-Id: <20220611064243.24535-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: helei.sig11@bytedance.com, virtualization@lists.linux-foundation.org,
 f4bug@amsat.org, zhenwei pi <pizhenwei@bytedance.com>, qemu-devel@nongnu.org
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

djkgLSB2MTA6Ci0gTWlub3IgZml4IG9mIGNvZGluZyBzdHlsZSBieSB2OS4KCnY4IC0gdjk6Ci0g
Rml4IGNvbXBpbGluZyBlcnJvciByZXBvcnRlZCBieSBjbGFuZy0xMy8xNDoKICBvcHQtPmhhc2hf
YWxnID0gY3J5cHRvZGV2X2J1aWx0aW5fZ2V0X3JzYV9oYXNoX2FsZ28oKTsgdGhpcyBsZWFkcwog
IGltcGxpY2l0IGNvbnZlcnRpb24gZnJvbSAnaW50JyB0byAndWludDMyJy4gJ2lmIChvcHQtPmhh
c2hfYWxnIDwgMCknCiAgaXMgYWx3YXlzIGZhbHNlLiBUaGFua3MgdG8gUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kuCgp2NyAtIHY4OgotIFRoZSBjaGFuZ2VzIG9mIFFFTVUgY3J5cHRvIGhhcyBiZWVu
IHJldmlld2VkICYgbWVyZ2VkIGJ5IERhbmllbCwKICByZW1vdmUgdGhpcyBwYXJ0IGZyb20gdGhp
cyBzZXJpZXMuIFRoYW5rcyB0byBEYW5pZWwhCi0gdmlydGlvX2NyeXB0by5oIGlzIHVwZGF0ZWQg
YnkgZTQwODIwNjNlNDdlCiAgKCJsaW51eC1oZWFkZXJzOiBVcGRhdGUgdG8gdjUuMTgtcmM2Iiks
IHJlbW92ZSBmcm9tIHRoaXMgc2VyaWVzLgotIE1pbm9yIGZpeGVzIHJldmlld2VkIGJ5IEdvbmds
ZWkuIFRoYW5rcyB0byBHb25nbGVpIQoKdjYgLT4gdjc6Ci0gRml4IHNlcnZhbCBidWlsZCBlcnJv
cnMgZm9yIHNvbWUgc3BlY2lmaWMgcGxhdGZvcm1zL2NvbmZpZ3VyYXRpb25zLgotIFVzZSAnJXp1
JyBpbnN0ZWFkIG9mICclbHUnIGZvciBzaXplX3QgcGFyYW1ldGVycy4KLSBBa0NpcGhlci1nY3J5
cHQ6IGF2b2lkIHNldHRpbmcgd3JvbmcgZXJyb3IgbWVzc2FnZXMgd2hlbiBwYXJzaW5nIFJTQQog
IGtleXMuCi0gQWtDaXBoZXItYmVuY2htYXJrOiBwcm9jZXNzIGNvbnN0YW50IGFtb3VudCBvZiBz
aWduL3ZlcmlmeSBpbnN0ZWFkCiBvZiBydW5uaW5nIHNpZ24vdmVyaWZ5IGZvciBhIGNvbnN0YW50
IGR1cmF0aW9uLgoKdjUgLT4gdjY6Ci0gRml4IGJ1aWxkIGVycm9ycyBhbmQgY29kZXN0eWxlcy4K
LSBBZGQgcGFyYW1ldGVyICdFcnJvciAqKmVycnAnIGZvciBxY3J5cHRvX2FrY2lwaGVyX3JzYWtl
eV9wYXJzZS4KLSBSZXBvcnQgbW9yZSBkZXRhaWxlZCBlcnJvcnMuCi0gRml4IGJ1ZmZlciBsZW5n
dGggY2hlY2sgYW5kIHJldHVybiB2YWx1ZXMgb2YgYWtjaXBoZXItbmV0dGxlLCBhbGxvd3MgY2Fs
bGVyIHRvCiBwYXNzIGEgYnVmZmVyIHdpdGggbGFyZ2VyIHNpemUgdGhhbiBhY3R1YWwgbmVlZGVk
LgoKQSBtaWxsaW9uIHRoYW5rcyB0byBEYW5pZWwhCgp2NCAtPiB2NToKLSBNb3ZlIFFDcnlwdG9B
a0NpcGhlciBpbnRvIGFrY2lwaGVycHJpdi5oLCBhbmQgbW9kaWZ5IHRoZSByZWxhdGVkIGNvbW1l
bnRzLgotIFJlbmFtZSBhc24xX2RlY29kZXIuYyB0byBkZXIuYy4KLSBDb2RlIHN0eWxlIGZpeDog
dXNlICdjbGVhbnVwJyAmICdlcnJvcicgbGFibGVzLgotIEFsbG93IGF1dG9wdHIgdHlwZSB0byBh
dXRvLWZyZWUuCi0gQWRkIHRlc3QgY2FzZXMgZm9yIHJzYWtleSB0byBoYW5kbGUgREVSIGVycm9y
LgotIE90aGVyIG1pbm9yIGZpeGVzLgoKdjMgLT4gdjQ6Ci0gQ29kaW5nIHN0eWxlIGZpeDogQWtj
aXBoZXIgLT4gQWtDaXBoZXIsIHN0cnVjdCBYWFggLT4gWFhYLCBSc2EgLT4gUlNBLApYWFgtYWxn
IC0+IFhYWC1hbGdvLgotIENoYW5nZSB2ZXJzaW9uIGluZm8gaW4gcWFwaS9jcnlwdG8uanNvbiwg
ZnJvbSA3LjAgLT4gNy4xLgotIFJlbW92ZSBlY2RzYSBmcm9tIHFhcGkvY3J5cHRvLmpzb24sIGl0
IHdvdWxkIGJlIGludHJvZHVjZWQgd2l0aCB0aGUgaW1wbGVtZXRpb24gbGF0ZXIuCi0gVXNlIFFD
cnlwdG9IYXNoQWxnb3RocmltIGluc3RlYWQgb2YgUUNyeXB0b1JTQUhhc2hBbGdvcml0aG0ocmVt
b3ZlZCkgaW4gcWFwaS9jcnlwdG8uanNvbi4KLSBSZW5hbWUgYXJndW1lbnRzIG9mIHFjcnlwdG9f
YWtjaXBoZXJfWFhYIHRvIGtlZXAgYWxpZ25lZCB3aXRoIHFjcnlwdG9fY2lwaGVyX1hYWChkZWMv
ZW5jL3NpZ24vdmVmaXJ5IC0+IGluL291dC9pbjIpLCBhbmQgYWRkIHFjcnlwdG9fYWtjaXBoZXJf
bWF4X1hYWCBBUElzLgotIEFkZCBuZXcgQVBJOiBxY3J5cHRvX2FrY2lwaGVyX3N1cHBvcnRzLgot
IENoYW5nZSB0aGUgcmV0dXJuIHZhbHVlIG9mIHFjcnlwdG9fYWtjaXBoZXJfZW5jL2RlYy9zaWdu
LCB0aGVzZSBmdW5jdGlvbnMgcmV0dXJuIHRoZSBhY3R1YWwgbGVuZ3RoIG9mIHJlc3VsdC4KLSBT
ZXBhcmF0ZSBBU04uMSBzb3VyY2UgY29kZSBhbmQgdGVzdCBjYXNlIGNsZWFuLgotIERpc2FibGUg
UlNBIHJhdyBlbmNvZGluZyBmb3IgYWtjaXBoZXItbmV0dGxlLgotIFNlcGFyYXRlIFJTQSBrZXkg
cGFyc2VyIGludG8gcnNha2V5LntoY30sIGFuZCBpbXBsZW1lbXRzIGl0IHdpdGggYnVpbHRpbi1h
c24xLWRlY29kZXIgYW5kIG5ldHRsZSByZXNwZWN0aXZseS4KLSBJbXBsZW1lbnQgUlNBKHBrY3Mx
IGFuZCByYXcgZW5jb2RpbmcpIGFsZ29yaXRobSBieSBnY3J5cHQuIFRoaXMgaGFzIGhpZ2hlciBw
cmlvcml0eSB0aGFuIG5ldHRsZS4KLSBGb3Igc29tZSBha2NpcGhlciBvcGVyYXRpb25zKGVnLCBk
ZWNyeXB0aW9uIG9mIHBrY3MxcGFkKHJzYSkpLCB0aGUgbGVuZ3RoIG9mIHJldHVybmVkIHJlc3Vs
dCBtYXliZSBsZXNzIHRoYW4gdGhlIGRzdCBidWZmZXIgc2l6ZSwgcmV0dXJuIHRoZSBhY3R1YWwg
bGVuZ3RoIG9mIHJlc3VsdCBpbnN0ZWFkIG9mIHRoZSBidWZmZXIgbGVuZ3RoIHRvIHRoZSBndWVz
dCBzaWRlLiAoaW4gZnVuY3Rpb24gdmlydGlvX2NyeXB0b19ha2NpcGhlcl9pbnB1dF9kYXRhX2hl
bHBlcikKLSBPdGhlciBtaW5vciBjaGFuZ2VzLgoKVGhhbmtzIHRvIERhbmllbCEKCkVyaWMgcG9p
bnRlZCBvdXQgdGhpcyBtaXNzaW5nIHBhcnQgb2YgdXNlIGNhc2UsIHNlbmQgaXQgaGVyZSBhZ2Fp
bi4KCkluIG91ciBwbGFuLCB0aGUgZmVhdHVyZSBpcyBkZXNpZ25lZCBmb3IgSFRUUFMgb2ZmbG9h
ZGluZyBjYXNlIGFuZCBvdGhlciBhcHBsaWNhdGlvbnMgd2hpY2ggdXNlIGtlcm5lbCBSU0EvZWNk
c2EgYnkga2V5Y3RsIHN5c2NhbGwuIFRoZSBmdWxsIHBpY3R1cmUgc2hvd3MgYmVsbG93OgoKCiAg
ICAgICAgICAgICAgICAgTmdpbngvb3BlbnNzbFsxXSAuLi4gQXBwcwpHdWVzdCAgIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAgICAgICAgICAgICAgIHZpcnRp
by1jcnlwdG8gZHJpdmVyWzJdCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KICAgICAgICAgICAgICAgICAgdmlydGlvLWNyeXB0byBiYWNrZW5kWzNdCkhv
c3QgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgICAg
ICAgICAgICAvICAgICAgICAgIHwgICAgICAgICAgXAogICAgICAgICAgICAgYnVpbHRpbls0XSAg
IHZob3N0ICAgICBrZXljdGxbNV0gLi4uCgoKWzFdIFVzZXIgYXBwbGljYXRpb25zIGNhbiBvZmZs
b2FkIFJTQSBjYWxjdWxhdGlvbiB0byBrZXJuZWwgYnkga2V5Y3RsIHN5c2NhbGwuIFRoZXJlIGlz
IG5vIGtleWN0bCBlbmdpbmUgaW4gb3BlbnNzbCBjdXJyZW50bHksIHdlIGRldmVsb3BlZCBhIGVu
Z2luZSBhbmQgdHJpZWQgdG8gY29udHJpYnV0ZSBpdCB0byBvcGVuc3NsIHVwc3RyZWFtLCBidXQg
b3BlbnNzbCAxLnggZG9lcyBub3QgYWNjZXB0IG5ldyBmZWF0dXJlLiBMaW5rOgogICBodHRwczov
L2dpdGh1Yi5jb20vb3BlbnNzbC9vcGVuc3NsL3B1bGwvMTY2ODkKClRoaXMgYnJhbmNoIGlzIGF2
YWlsYWJsZSBhbmQgbWFpbnRhaW5lZCBieSBMZWkgPGhlbGVpLnNpZzExQGJ5dGVkYW5jZS5jb20+
CiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9Ub3VzYWthUmluL29wZW5zc2wvdHJlZS9PcGVuU1NMXzFf
MV8xLWtjdGxfZW5naW5lCgpXZSB0ZXN0ZWQgbmdpbngoY2hhbmdlIGNvbmZpZyBmaWxlIG9ubHkp
IHdpdGggb3BlbnNzbCBrZXljdGwgZW5naW5lLCBpdCB3b3JrcyBmaW5lLgoKWzJdIHZpcnRpby1j
cnlwdG8gZHJpdmVyIGlzIHVzZWQgdG8gY29tbXVuaWNhdGUgd2l0aCBob3N0IHNpZGUsIHNlbmQg
cmVxdWVzdHMgdG8gaG9zdCBzaWRlIHRvIGRvIGFzeW1tZXRyaWMgY2FsY3VsYXRpb24uCiAgIGh0
dHBzOi8vbGttbC5vcmcvbGttbC8yMDIyLzMvMS8xNDI1CgpbM10gdmlydGlvLWNyeXB0byBiYWNr
ZW5kIGhhbmRsZXMgcmVxdWVzdHMgZnJvbSBndWVzdCBzaWRlLCBhbmQgZm9yd2FyZHMgcmVxdWVz
dCB0byBjcnlwdG8gYmFja2VuZCBkcml2ZXIgb2YgUUVNVS4KCls0XSBDdXJyZW50bHkgUlNBIGlz
IHN1cHBvcnRlZCBvbmx5IGluIGJ1aWx0aW4gZHJpdmVyLiBUaGlzIGRyaXZlciBpcyBzdXBwb3Nl
ZCB0byB0ZXN0IHRoZSBmdWxsIGZlYXR1cmUgd2l0aG91dCBvdGhlciBzb2Z0d2FyZShFeCB2aG9z
dCBwcm9jZXNzKSBhbmQgaGFyZHdhcmUgZGVwZW5kZW5jZS4gZWNkc2EgaXMgaW50cm9kdWNlZCBp
bnRvIHFhcGkgdHlwZSB3aXRob3V0IGltcGxlbWVudGF0aW9uLCB0aGlzIG1heSBiZSBpbXBsZW1l
bnRlZCBpbiBRMy0yMDIyIG9yIGxhdGVyLiBJZiBlY2RzYSB0eXBlIGRlZmluaXRpb24gc2hvdWxk
IGJlIGFkZGVkIHdpdGggdGhlIGltcGxlbWVudGF0aW9uIHRvZ2V0aGVyLCBJJ2xsIHJlbW92ZSB0
aGlzIGluIG5leHQgdmVyc2lvbi4KCls1XSBrZXljdGwgYmFja2VuZCBpcyBpbiBkZXZlbG9wbWVu
dCwgd2Ugd2lsbCBwb3N0IHRoaXMgZmVhdHVyZSBpbiBRMi0yMDIyLiBrZXljdGwgYmFja2VuZCBj
YW4gdXNlIGhhcmR3YXJlIGFjY2VsZXJhdGlvbihFeCwgSW50ZWwgUUFUKS4KClNldHVwIHRoZSBm
dWxsIGVudmlyb25tZW50LCB0ZXN0ZWQgd2l0aCBJbnRlbCBRQVQgb24gaG9zdCBzaWRlLCB0aGUg
UVBTIG9mIEhUVFBTIGluY3JlYXNlIHRvIH4yMDAlIGluIGEgZ3Vlc3QuCgpWUyBQQ0kgcGFzc3Ro
cm91Z2g6IHRoZSBtb3N0IGltcG9ydGFudCBiZW5lZml0IG9mIHRoaXMgc29sdXRpb24gbWFrZXMg
dGhlIFZNIG1pZ3JhdGFibGUuCgp2MiAtPiB2MzoKLSBJbnRyb2R1Y2UgYWtjaXBoZXIgdHlwZXMg
dG8gcWFwaQotIEFkZCB0ZXN0L2JlbmNobWFyayBzdWl0ZSBmb3IgYWtjaXBoZXIgY2xhc3MKLSBT
ZXBlcmF0ZSAndmlydGlvX2NyeXB0bzogU3VwcG9ydCB2aXJ0aW8gY3J5cHRvIGFzeW0gb3BlcmF0
aW9uJyBpbnRvOgogLSBjcnlwdG86IEludHJvZHVjZSBha2NpcGhlciBjcnlwdG8gY2xhc3MKIC0g
dmlydGlvLWNyeXB0bzogSW50cm9kdWNlIFJTQSBhbGdvcml0aG0KCnYxIC0+IHYyOgotIFVwZGF0
ZSB2aXJ0aW9fY3J5cHRvLmggZnJvbSB2MiB2ZXJzaW9uIG9mIHJlbGF0ZWQga2VybmVsIHBhdGNo
LgoKdjE6Ci0gU3VwcG9ydCBha2NpcGhlciBmb3IgdmlydGlvLWNyeXB0by4KLSBJbnRyb2R1Y2Ug
YWtjaXBoZXIgY2xhc3MuCi0gSW50cm9kdWNlIEFTTjEgZGVjb2RlciBpbnRvIFFFTVUuCi0gSW1w
bGVtZW50IFJTQSBiYWNrZW5kIGJ5IG5ldHRsZS9ob2d3ZWVkLgoKWmhlbndlaSBQaSAoMSk6CiAg
Y3J5cHRvOiBJbnRyb2R1Y2UgUlNBIGFsZ29yaXRobQoKIGJhY2tlbmRzL2NyeXB0b2Rldi1idWls
dGluLmMgICAgICB8IDI3NiArKysrKysrKysrKysrKysrKysrKystLS0tCiBiYWNrZW5kcy9jcnlw
dG9kZXYtdmhvc3QtdXNlci5jICAgfCAgMzQgKysrLQogYmFja2VuZHMvY3J5cHRvZGV2LmMgICAg
ICAgICAgICAgIHwgIDMyICsrLQogaHcvdmlydGlvL3ZpcnRpby1jcnlwdG8uYyAgICAgICAgIHwg
MzIzICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogaW5jbHVkZS9ody92aXJ0aW8vdmly
dGlvLWNyeXB0by5oIHwgICA1ICstCiBpbmNsdWRlL3N5c2VtdS9jcnlwdG9kZXYuaCAgICAgICAg
fCAgODMgKysrKysrLS0KIDYgZmlsZXMgY2hhbmdlZCwgNjA5IGluc2VydGlvbnMoKyksIDE0NCBk
ZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
